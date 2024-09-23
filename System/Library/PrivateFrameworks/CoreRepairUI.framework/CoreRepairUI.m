void sub_22AC6700C(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_255B49860;
  qword_255B49860 = v2;

}

void sub_22AC6734C()
{
  SystemHealthUI *v0;
  void *v1;

  v0 = objc_alloc_init(SystemHealthUI);
  v1 = (void *)qword_255B49870;
  qword_255B49870 = (uint64_t)v0;

}

void sub_22AC676E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC67700(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  const __SCNetworkReachability *v5;
  const __SCNetworkReachability *v6;
  SCNetworkReachabilityFlags v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[7];
  _QWORD v63[5];
  SCNetworkReachabilityFlags flags;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t buf[4];
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = sub_22AC68124;
  v79 = sub_22AC68134;
  v80 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = sub_22AC68124;
  v73 = sub_22AC68134;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 0;
  v4 = (const char *)objc_msgSend(CFSTR("apple.com"), "UTF8String");
  v5 = SCNetworkReachabilityCreateWithName((CFAllocatorRef)*MEMORY[0x24BDBD240], v4);
  v6 = v5;
  if (!v5)
    goto LABEL_16;
  flags = 0;
  if (SCNetworkReachabilityGetFlags(v5, &flags))
  {
    v7 = flags;
    sub_22AC82A9C(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v82 = (v7 & 2) >> 1;
      _os_log_impl(&dword_22AC64000, v8, OS_LOG_TYPE_DEFAULT, "Network reachability: %d", buf, 8u);
    }

    v9 = (v7 >> 1) & 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  CFRelease(v6);
  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair.intentControl"), 0);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B668D0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRemoteObjectInterface:", v11);

    objc_msgSend(v10, "resume");
    v12 = MEMORY[0x24BDAC760];
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = sub_22AC6813C;
    v63[3] = &unk_24F4D49B0;
    v63[4] = &v69;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v63);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v12;
    v62[1] = 3221225472;
    v62[2] = sub_22AC681AC;
    v62[3] = &unk_24F4D49D8;
    v62[4] = &v75;
    v62[5] = &v69;
    v62[6] = &v65;
    objc_msgSend(v13, "getRepairTicket:", v62);

    if (*((_BYTE *)v66 + 24) && (v14 = (void *)v76[5]) != 0 && objc_msgSend(v14, "length") && !v70[5])
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isPreFlightDone") & 1) != 0)
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
        objc_msgSend(v40, "objectForKey:", CFSTR("cachedPreFlightResults"));
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE27E88], "spcResults:", v61);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("sealed"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("pass"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v60, "mutableCopy");
        if (v42 && objc_msgSend(v42, "count"))
          objc_msgSend(v33, "addObject:", CFSTR("RECOVER"));
        if (v33 && objc_msgSend(v33, "count"))
        {
          sub_22AC82A9C(0);
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22AC64000, v43, OS_LOG_TYPE_DEFAULT, "Proceeding with bootIntent reboot", buf, 2u);
          }

          objc_msgSend(v10, "remoteObjectProxy");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "localeIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setBootIntentAndRebootToCheckerboardWithLocale:reply:", v46, &unk_24F4D4A58);

        }
        else
        {
          v54 = (void *)MEMORY[0x24BEBD3B0];
          objc_msgSend(*(id *)(a1 + 32), "localizedStringWithKey:defaultString:", CFSTR("NOT_AVAILABLE"), CFSTR("NOT_AVAILABLE"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("TRY_AGAIN_LATER_DESC"), CFSTR("TRY_AGAIN_LATER_DESC"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "alertControllerWithTitle:message:preferredStyle:", v55, v56, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v57 = (void *)MEMORY[0x24BEBD3A8];
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("CANCEL"), CFSTR("CANCEL"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "actionWithTitle:style:handler:", v58, 1, 0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addAction:", v59);

          objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v44, 1, 0);
        }

      }
      else
      {
        sub_22AC82A9C(0);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22AC64000, v47, OS_LOG_TYPE_DEFAULT, "Mini preflight pending", buf, 2u);
        }

        v48 = (void *)MEMORY[0x24BEBD3B0];
        objc_msgSend(*(id *)(a1 + 32), "localizedStringWithKey:defaultString:", CFSTR("NOT_AVAILABLE"), CFSTR("NOT_AVAILABLE"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("TRY_AGAIN_LATER_DESC"), CFSTR("TRY_AGAIN_LATER_DESC"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "alertControllerWithTitle:message:preferredStyle:", v49, v50, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = (void *)MEMORY[0x24BEBD3A8];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("OK"), CFSTR("OK"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "actionWithTitle:style:handler:", v52, 1, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addAction:", v53);

        objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v33, 1, 0);
      }
    }
    else
    {
      sub_22AC82A9C(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22AC64000, v15, OS_LOG_TYPE_DEFAULT, "OS Update required to proceed", buf, 2u);
      }

      v16 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(*(id *)(a1 + 32), "localizedStringWithKey:defaultString:", CFSTR("SOFTWARE_UPDATE_REQUIRED"), CFSTR("SOFTWARE_UPDATE_REQUIRED"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 1416);
      if (*(_DWORD *)(v18 + 1424) == 3)
        objc_msgSend(v19, "localizedStringWithKey:defaultString:", CFSTR("SOFTWARE_UPDATE_DESC_IPAD"), CFSTR("SOFTWARE_UPDATE_DESC_IPAD"));
      else
        objc_msgSend(v19, "localizedStringWithKey:defaultString:", CFSTR("SOFTWARE_UPDATE_DESC"), CFSTR("SOFTWARE_UPDATE_DESC"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "alertControllerWithTitle:message:preferredStyle:", v17, v32, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("SOFTWARE_UPDATE"), CFSTR("SOFTWARE_UPDATE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "actionWithTitle:style:handler:", v35, 0, &unk_24F4D4A18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addAction:", v36);

      v37 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("CANCEL"), CFSTR("CANCEL"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "actionWithTitle:style:handler:", v38, 1, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addAction:", v39);

      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v33, 1, 0);
    }

  }
  else
  {
LABEL_16:
    sub_22AC82A9C(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22AC64000, v20, OS_LOG_TYPE_DEFAULT, "Network is not reachable", buf, 2u);
    }

    v21 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("NETWORK_CONNECTION_REQUIRED"), CFSTR("NETWORK_CONNECTION_REQUIRED"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(void **)(v23 + 1416);
    if (*(_DWORD *)(v23 + 1424) == 3)
      objc_msgSend(v24, "localizedStringWithKey:defaultString:", CFSTR("NETWORK_CONNECTION_DESC_IPAD"), CFSTR("NETWORK_CONNECTION_DESC_IPAD"));
    else
      objc_msgSend(v24, "localizedStringWithKey:defaultString:", CFSTR("NETWORK_CONNECTION_DESC"), CFSTR("NETWORK_CONNECTION_DESC"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alertControllerWithTitle:message:preferredStyle:", v22, v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("INTERNET_CONNECTION"), CFSTR("INTERNET_CONNECTION"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 0, &unk_24F4D4A78);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v28);

    v29 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1416), "localizedStringWithKey:defaultString:", CFSTR("CANCEL"), CFSTR("CANCEL"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 1, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v31);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v10, 1, 0);
  }

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v75, 8);
}

void sub_22AC680B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AC68124(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22AC68134(uint64_t a1)
{

}

void sub_22AC6813C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  sub_22AC82A9C(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_22AC854A0((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void sub_22AC681AC(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a3);
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  sub_22AC82A9C(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109634;
    v11[1] = a2;
    v12 = 2112;
    v13 = v9;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "repairTicket status:%d:error:%@:ticket:%@", (uint8_t *)v11, 0x1Cu);
  }

}

void sub_22AC682CC()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=SOFTWARE_UPDATE_LINK"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void sub_22AC68334(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = v4;
    v8 = 1024;
    v9 = a2;
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "setBootIntentAndRebootToCheckerboardWithLocale:Reply: error:%@:status:%d", (uint8_t *)&v6, 0x12u);
  }

}

void sub_22AC683F8()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void sub_22AC68A24(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  _xpc_activity_s *v10;
  __int16 v11;
  xpc_activity_state_t state;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!xpc_activity_get_state(v3))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6B8], 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x24BDAC6E0], 1);
    xpc_activity_set_criteria(v3, v5);
    goto LABEL_15;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "performMiniPreflight");
  }
  else if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "getCAAForRepairHistory");
  }
  if (xpc_activity_should_defer(v3))
  {
    v6 = xpc_activity_set_state(v3, 3);
    sub_22AC82A9C(0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v7)
      {
        v9 = 138412546;
        v10 = v3;
        v11 = 2048;
        state = xpc_activity_get_state(v3);
        v8 = "Successfully deferred activity %@ to state: %lu";
LABEL_14:
        _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v9, 0x16u);
      }
    }
    else if (v7)
    {
      v9 = 138412546;
      v10 = v3;
      v11 = 2048;
      state = xpc_activity_get_state(v3);
      v8 = "Failed to set state to DEFER for activity %@ current state: %lu";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  xpc_activity_set_state(v3, 5);
LABEL_16:

}

uint64_t sub_22AC68F94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scheduleNetworkActivityWith:", 0);
}

void sub_22AC69568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22AC69580(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  v2 = (void *)objc_opt_new();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22AC695F4;
  v4[3] = &unk_24F4D4B18;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "preflight:withReply:", v3, v4);

}

void sub_22AC695F4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  sub_22AC82A9C(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    LODWORD(v17) = a2;
    _os_log_impl(&dword_22AC64000, v9, OS_LOG_TYPE_DEFAULT, "Preflight success: %d", (uint8_t *)&v16, 8u);
  }

  sub_22AC82A9C(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "Preflight results: %@", (uint8_t *)&v16, 0xCu);
  }

  sub_22AC82A9C(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, "Preflight error: %@", (uint8_t *)&v16, 0xCu);
  }

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;
  v14 = v7;

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird.systemhealth"));
  objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("cachedPreFlightResults"));

  notify_post("com.apple.mobilerepair.refreshui");
}

void sub_22AC69A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AC69A94(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_22AC69AFC;
  v4[3] = &unk_24F4D4B68;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 48);
  return objc_msgSend(v2, "issueClientCertificateWithCompletionOnQueue:withOptions:completion:", 0, v1, v4);
}

void sub_22AC69AFC(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  sub_22AC82A9C(0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((a2 & 1) == 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AC85680((uint64_t)v8, v10, v25, v26, v27, v28, v29, v30);
    goto LABEL_21;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v7, "referenceKey");
    objc_msgSend(v7, "certificates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_22AC64000, v10, OS_LOG_TYPE_DEFAULT, "BIK:%@ Certs:%@", buf, 0x16u);

  }
  objc_msgSend(v7, "certificates");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_19;
  v14 = (void *)v13;
  objc_msgSend(v7, "certificates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count") != 2)
  {

LABEL_19:
    sub_22AC82A9C(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_22AC85654();
    goto LABEL_21;
  }
  v16 = objc_msgSend(v7, "referenceKey");

  if (!v16)
    goto LABEL_19;
  sub_22AC82A9C(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, "BIK and BAA issues success", buf, 2u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "certifcateType");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 1)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v18 + 40);
    objc_msgSend(v7, "extractRepairHistoryWithError:", &obj);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v18 + 40), obj);
    sub_22AC82A9C(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      v33 = (uint64_t)v10;
      v34 = 2112;
      v35 = v20;
      _os_log_impl(&dword_22AC64000, v19, OS_LOG_TYPE_DEFAULT, "repairHistory: %@ error: %@", buf, 0x16u);
    }

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isVaildCAA:", v10))
      {
        objc_msgSend(MEMORY[0x24BE27E98], "getLocalSealingManifest");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
        objc_msgSend(v22, "setObject:forKey:", v21, CFSTR("cachedSealingManifest"));

        objc_msgSend(*(id *)(a1 + 32), "clearCAARequestHistory");
      }
      objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
      objc_msgSend(v24, "setObject:forKey:", v23, CFSTR("cachedCAACert"));

    }
LABEL_21:

  }
}

void sub_22AC6E6E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v7 = *(void **)(*(_QWORD *)(a1 + 40) + 1392);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("exceptionCount:"), "stringByAppendingString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v10, v6);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = *(id *)(a1 + 48);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j);
        v17 = *(void **)(*(_QWORD *)(a1 + 40) + 1392);
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sendAsyncAnalyticsForEventIfNeeded:moduleName:", v19, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

}

void sub_22AC6EA24(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadCurrentSystemHealthInfoSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC82A9C(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_22AC64000, v5, OS_LOG_TYPE_DEFAULT, "Got new specifiers: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AC6EB7C;
  block[3] = &unk_24F4D4C08;
  objc_copyWeak(&v10, v2);
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v10);
}

void sub_22AC6EB7C(id *a1)
{
  id *WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void (**v15)(void);
  __int16 v16[8];
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = objc_msgSend(a1[4], "count");
  v4 = objc_msgSend(WeakRetained[179], "count");
  objc_msgSend(WeakRetained, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specifierDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "findSpecifierToInsertAfter:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = sub_22AC6ED90;
      v17[3] = &unk_24F4D4BE0;
      v17[4] = WeakRetained;
      v18 = a1[4];
      v19 = v7;
      v20 = a1[5];
      objc_msgSend(v6, "performUpdatesAnimated:usingBlock:", v3 != v4, v17);

    }
    else
    {
      v9 = (void *)MEMORY[0x24BE755A0];
      objc_msgSend(WeakRetained, "parentViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "specifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updatesWithSpecifiers:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "_updateSpecifiers:specifierToInsertAfter:withUpdates:", a1[4], v7, v12);
      objc_msgSend(WeakRetained, "parentViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "performSpecifierUpdates:", v12);

      sub_22AC82A9C(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16[0] = 0;
        _os_log_impl(&dword_22AC64000, v14, OS_LOG_TYPE_DEFAULT, "DONE updateSpecifiersWithCompletionHandler", (uint8_t *)v16, 2u);
      }

      v15 = (void (**)(void))a1[5];
      if (v15)
        v15[2]();

    }
  }
  else
  {
    v8 = (void (**)(void))a1[5];
    if (v8)
      v8[2]();
  }

}

uint64_t sub_22AC6ED90(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_updateSpecifiers:specifierToInsertAfter:withUpdates:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "DONE updateSpecifiersWithCompletionHandler", v5, 2u);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_22AC6F29C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_22AC6F2C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22AC6F2D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22AC6F4F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B49880;
  qword_255B49880 = v1;

}

void sub_22AC70358(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE63540], "sharedDataAccessor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v6 = (void *)objc_msgSend(v5, "copyPathForPersistentData:error:", 100, &v23);
    v7 = v23;

    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("datapath"));
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BE27E70]), "initForRegisterChangeWithParameters:", v4);
      if (!v10)
      {
        sub_22AC82A9C(1uLL);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_22AC857C8(a1);
        goto LABEL_24;
      }
      v7 = v10;
      if (xpc_activity_should_defer(v3))
      {
        v11 = xpc_activity_set_state(v3, 3);
        sub_22AC82A9C(0);
        v12 = objc_claimAutoreleasedReturnValue();
        v9 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "componentName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully deferred activity %@ to state: %lu"), v3, xpc_activity_get_state(v3));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v13;
            v26 = 2112;
            v27 = v14;
            _os_log_impl(&dword_22AC64000, v9, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          sub_22AC8587C(a1, v3);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "componentName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0;
        v16 = -[NSObject registerChangeForComponent:fdrError:](v7, "registerChangeForComponent:fdrError:", v15, &v22);
        v9 = v22;

        if (!v16)
        {
          sub_22AC82A9C(0);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "componentName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] register change was successful"), "-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v25 = v18;
            v26 = 2112;
            v27 = v19;
            _os_log_impl(&dword_22AC64000, v17, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

          }
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "componentHasNotifiedServerKey");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setBool:forKey:", 1, v21);

          objc_msgSend(v20, "synchronize");
        }
        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      sub_22AC82A9C(1uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_22AC85714(a1);
    }

LABEL_24:
    goto LABEL_25;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6B8], 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC6E0], 1);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x24BDAC660], 1);
  xpc_activity_set_criteria(v3, v4);
LABEL_25:

}

void sub_22AC716F8(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  void *v4;
  void *v5;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    objc_msgSend(v4, "unlockCheckerActivityBodyForFinishRepair");
  }
  else
  {
    objc_msgSend(v4, "createCriteriaForUnlockCheckerWithInterval:", *(double *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(activity, v5);

  }
}

void sub_22AC71760(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  void *v4;
  void *v5;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    objc_msgSend(v4, "unlockCheckerActivityBody");
  }
  else
  {
    objc_msgSend(v4, "createCriteriaForUnlockCheckerWithInterval:", *(double *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_activity_set_criteria(activity, v5);

  }
}

void sub_22AC71EF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC724C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC72514(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v2) = -1;
  do
  {
    v2 = (v2 + 1);
    sub_22AC82A9C(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "componentName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] Retry Count:%d"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    sleep(0xAu);
    objc_msgSend(*(id *)(a1 + 32), "componentAuthHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copyComponentStatus");

  }
  while (!v7 && v2 < 9);
  if (v2 <= 8 && v7 == 1)
  {
    sub_22AC82A9C(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "componentName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] cleaning up corefollowup finally"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_22AC64000, v8, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "clearRepairFollowUp");
    objc_msgSend(WeakRetained, "sendAnalyticsForCount:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(WeakRetained, "clearNSUserDefaults");
  }

}

id sub_22AC729A4(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[7];

  v29[6] = *MEMORY[0x24BDAC8D0];
  v28[0] = CFSTR("EventType");
  v2 = *(void **)(a1 + 32);
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29[0] = v3;
  v28[1] = CFSTR("isSUCase");
  v4 = objc_msgSend(*(id *)(a1 + 40), "isSUCaseForComponent");
  v5 = MEMORY[0x24BDBD1C0];
  if (v4)
    v5 = MEMORY[0x24BDBD1C8];
  v29[1] = v5;
  v28[2] = CFSTR("ModuleType");
  objc_msgSend(*(id *)(a1 + 40), "componentName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v6;
  v28[3] = CFSTR("AuthStatus");
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(*(id *)(a1 + 40), "componentAuthHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "copyComponentStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v9;
  v28[4] = CFSTR("UICoreFollowUpShownDuration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v10;
  v28[5] = CFSTR("UILockscreenNotification");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  sub_22AC82A9C(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "componentName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] send event: %@"), "-[MRBaseComponentHandler sendAnalyticsForCount:]_block_invoke", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl(&dword_22AC64000, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  sub_22AC82A9C(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "componentName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 40), "componentName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    v21 = v20;
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "stringWithFormat:", CFSTR("CoreAnalyticsEvent: ModuleType(%@), EventType(%@)"), v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v17;
    v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_22AC64000, v16, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    if (!v20)

  }
  return v12;
}

void sub_22AC737D0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_22AC737E4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_22AC73810(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_22AC73E14(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("bcrt")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("vcrt")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49890;
    qword_255B49890 = v2;

  }
}

void sub_22AC740F4(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_255B498A0;
  qword_255B498A0 = v2;

}

void sub_22AC74498(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B498B0;
  qword_255B498B0 = v1;

}

void sub_22AC74E20(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_255B498C0;
  qword_255B498C0 = v2;

}

void sub_22AC75104(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B498D0;
  qword_255B498D0 = v1;

}

void sub_22AC7B28C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B498E8;
  qword_255B498E8 = v1;

}

void sub_22AC7B3DC(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint8_t buf[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BE1B3A0];
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithLabel:url:", v5, *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "addObject:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BE1B3B8]);
  v8 = v7;
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(v7, "setFrequency:", 0.0);
    objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v9);

    objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInformativeText:", v10);

    objc_msgSend(v3, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnlockActionLabel:", v11);

    objc_msgSend(v8, "setFirstNotificationDelay:", 0.0);
    objc_msgSend(v8, "setActivateAction:", v6);
    objc_msgSend(v8, "setClearAction:", 0);
    v12 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = *MEMORY[0x24BE1B348];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOptions:", v14);

  }
  v15 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
  objc_msgSend(v15, "setUniqueIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v15, "setGroupIdentifier:", *MEMORY[0x24BE1B2E8]);
  v16 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTitle:", v19);

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInformativeText:", v23);

  objc_msgSend(v15, "setDisplayStyle:", 2);
  objc_msgSend(v15, "setActions:", v2);
  if (*(_BYTE *)(a1 + 80))
    v24 = v8;
  else
    v24 = 0;
  objc_msgSend(v15, "setNotification:", v24);
  objc_msgSend(v15, "setTargetBundleIdentifier:", *MEMORY[0x24BE1B2B0]);
  notify_post("com.apple.mobilerepairui.reload");
  sub_22AC82A9C(0);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v15;
    _os_log_impl(&dword_22AC64000, v25, OS_LOG_TYPE_DEFAULT, "Posting item: %@", buf, 0xCu);
  }

  v30 = 0;
  v26 = objc_msgSend(v29, "postFollowUpItem:error:", v15, &v30);
  v27 = v30;
  if ((v26 & 1) == 0)
  {
    sub_22AC82A9C(1uLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_22AC85AE0(v27);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 16), "setObject:forKeyedSubscript:", v15, *(_QWORD *)(a1 + 56));

}

void sub_22AC7BAD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC7BB00(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const __CFDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  __CFUserNotification *v25;
  __CFUserNotification *v26;
  uint64_t v27;
  const __CFDictionary *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  SInt32 error;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("settingsView"));

  sub_22AC82A9C(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v51) = v3;
    _os_log_impl(&dword_22AC64000, v4, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (v3 && !*(_BYTE *)(a1 + 64))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    responseFlags = 0;
    error = 0;
    v5 = (void *)objc_opt_new();
    v46 = a1;
    v7 = *(_QWORD *)(a1 + 40);
    v6 = a1 + 40;
    v8 = *(unsigned __int8 *)(v6 + 24);
    v43 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", v7, v7);
    v44 = objc_claimAutoreleasedReturnValue();
    v42 = *MEMORY[0x24BDBD6D8];
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "localizedStringWithKey:defaultString:", *(_QWORD *)(v6 + 8), *(_QWORD *)(v6 + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("\n%@\n"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *MEMORY[0x24BDBD6E0];
    v45 = v5;
    if (v8)
    {
      objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x24BDBD6F8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *MEMORY[0x24BEB0E40];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x24BEB0E58];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v15;
      v19 = (void *)v44;
      objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, v42, v11, v41, v12, v13, v14, v37, v16, v17, v18, *MEMORY[0x24BEB0E18], &unk_24F4DDA78, *MEMORY[0x24BEB0EB0], 0);
      v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("OK"), CFSTR("OK"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *MEMORY[0x24BDBD6F8];
      objc_msgSend(v5, "localizedStringWithKey:defaultString:", CFSTR("SETTINGS"), CFSTR("SETTINGS"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = *MEMORY[0x24BDBD6F0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x24BEB0E40];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x24BEB0E58];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v21;
      v19 = (void *)v44;
      objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, v42, v11, v41, v12, v40, v14, v39, v16, v38, v18, v22, v23, *MEMORY[0x24BEB0E18], &unk_24F4DDA78, *MEMORY[0x24BEB0EB0], 0);
      v24 = objc_claimAutoreleasedReturnValue();

      v20 = (const __CFDictionary *)v24;
    }

    v25 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, &error, v20);
    if (v25)
    {
      v26 = v25;
      CFUserNotificationReceiveResponse(v25, 0.0, &responseFlags);
      v27 = v46;
      if (responseFlags == 1)
      {
        v28 = v20;
        sub_22AC82A9C(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)v6;
          *(_DWORD *)buf = 138412290;
          v51 = v30;
          _os_log_impl(&dword_22AC64000, v29, OS_LOG_TYPE_DEFAULT, "%@ User pressed button", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(v46 + 56);
        v47 = 0;
        v33 = objc_msgSend(v31, "openSensitiveURL:withOptions:error:", v32, 0, &v47);
        v34 = v47;

        v20 = v28;
        if ((v33 & 1) == 0)
        {
          sub_22AC82A9C(1uLL);
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            sub_22AC85BE8((uint64_t *)(v46 + 56), v34, v35);

        }
      }
      CFRelease(v26);
    }
    else
    {
      sub_22AC82A9C(1uLL);
      v36 = objc_claimAutoreleasedReturnValue();
      v27 = v46;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_22AC85B5C((uint64_t *)v6, &error, v36);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v27 + 32));

  }
}

void sub_22AC7C1A4()
{
  void *v0;
  id v1;
  _QWORD v2[4];
  id v3;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_22AC7C228;
  v2[3] = &unk_24F4D4D60;
  v3 = v0;
  v1 = v0;
  objc_msgSend(v1, "pendingFollowUpItemsWithCompletion:", v2);

}

void sub_22AC7C228(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  __objc2_class **v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id obj;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  char v85[16];
  char v86[16];
  uint8_t buf[4];
  id v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v78 = a3;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0x24BE1B000uLL;
    v77 = *(_QWORD *)v82;
    v76 = *MEMORY[0x24BE1B2E8];
    v67 = *MEMORY[0x24BE1B2B0];
    do
    {
      v8 = 0;
      v68 = v6;
      do
      {
        if (*(_QWORD *)v82 != v77)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v8);
        v10 = objc_alloc_init(*(Class *)(v7 + 944));
        objc_msgSend(v9, "uniqueIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setUniqueIdentifier:", v11);

        objc_msgSend(v10, "setGroupIdentifier:", v76);
        objc_msgSend(v9, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(CFSTR("com.apple.mobilerepair.DisplayRepair"), "isEqualToString:", v12);

        v14 = off_24F4D4298;
        if ((v13 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(CFSTR("com.apple.mobilerepair.BatteryRepair"), "isEqualToString:", v15);

        v14 = off_24F4D4280;
        if ((v16 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(CFSTR("com.apple.mobilerepair.CameraRepair"), "isEqualToString:", v17);

        v14 = off_24F4D4290;
        if ((v18 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(CFSTR("com.apple.mobilerepair.BluetoothRepair"), "isEqualToString:", v19);

        v14 = off_24F4D4288;
        if ((v20 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(CFSTR("com.apple.mobilerepair.WifiRepair"), "isEqualToString:", v21);

        v14 = &off_24F4D42C8;
        if ((v22 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(CFSTR("com.apple.mobilerepair.BasebandRepair"), "isEqualToString:", v23);

        v14 = off_24F4D4278;
        if ((v24 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(CFSTR("com.apple.mobilerepair.BasebandRepair"), "isEqualToString:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(CFSTR("com.apple.mobilerepair.NFCRepair"), "isEqualToString:", v27);

        v14 = off_24F4D42B0;
        if ((v28 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(CFSTR("com.apple.mobilerepair.UWBRepair"), "isEqualToString:", v29);

        v14 = off_24F4D42C0;
        if ((v30 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(CFSTR("com.apple.mobilerepair.AudioRepair"), "isEqualToString:", v31);

        v14 = off_24F4D4270;
        if ((v32 & 1) != 0)
          goto LABEL_18;
        objc_msgSend(v9, "uniqueIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(CFSTR("com.apple.mobilerepair.FaceIDRepair"), "isEqualToString:", v33);

        v14 = &off_24F4D42A0;
        if ((v34 & 1) != 0
          || (objc_msgSend(v9, "uniqueIdentifier"),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              v36 = objc_msgSend(CFSTR("com.apple.mobilerepair.TouchIDRepair"), "isEqualToString:", v35),
              v35,
              v14 = off_24F4D42B8,
              v36))
        {
LABEL_18:
          -[__objc2_class sharedSingleton](*v14, "sharedSingleton");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "popUpNotificationTitle");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          -[__objc2_class sharedSingleton](*v14, "sharedSingleton");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "followUpInfoMessage");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v40 = 0;
          v38 = 0;
        }
        sub_22AC82A9C(0);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v38;
          _os_log_impl(&dword_22AC64000, v41, OS_LOG_TYPE_DEFAULT, "Title key :%@", buf, 0xCu);
        }

        sub_22AC82A9C(0);
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v40;
          _os_log_impl(&dword_22AC64000, v42, OS_LOG_TYPE_DEFAULT, "infotext key:%@", buf, 0xCu);
        }

        if (v38 && v40)
        {
          v74 = v8;
          v43 = v9;
          v71 = v9;
          v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v45 = (void *)objc_opt_new();
          v46 = (void *)MEMORY[0x24BE1B3A0];
          objc_msgSend(v45, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "actions");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "url");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "actionWithLabel:url:", v47, v50);
          v51 = objc_claimAutoreleasedReturnValue();

          v72 = (void *)v51;
          objc_msgSend(v44, "addObject:", v51);
          objc_msgSend(v45, "localizedStringWithKey:defaultString:", v38, v38);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTitle:", v52);

          v73 = v45;
          objc_msgSend(v45, "localizedStringWithKey:defaultString:", v40, v40);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setInformativeText:", v53);

          objc_msgSend(v10, "setDisplayStyle:", 2);
          v75 = v44;
          objc_msgSend(v10, "setActions:", v44);
          objc_msgSend(v10, "setTargetBundleIdentifier:", v67);
          v54 = *(void **)(a1 + 32);
          v55 = (void *)MEMORY[0x24BDBCE30];
          objc_msgSend(v71, "uniqueIdentifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "arrayWithObjects:", v56, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = v78;
          LOBYTE(v54) = objc_msgSend(v54, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v57, &v80);
          v58 = v80;

          if ((v54 & 1) != 0)
          {
            sub_22AC82A9C(0);
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22AC64000, v59, OS_LOG_TYPE_DEFAULT, "Successfully deleted the followup", buf, 2u);
            }

            sub_22AC82A9C(0);
            v60 = objc_claimAutoreleasedReturnValue();
            v8 = v74;
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v88 = v10;
              _os_log_impl(&dword_22AC64000, v60, OS_LOG_TYPE_DEFAULT, "Re Posting item: %@", buf, 0xCu);
            }

            v61 = *(void **)(a1 + 32);
            v79 = v58;
            v62 = objc_msgSend(v61, "postFollowUpItem:error:", v10, &v79);
            v78 = v79;

            v63 = v73;
            if ((v62 & 1) != 0)
            {
              v6 = v68;
              v7 = 0x24BE1B000;
              v64 = v75;
LABEL_39:

              goto LABEL_40;
            }
            sub_22AC82A9C(1uLL);
            v65 = objc_claimAutoreleasedReturnValue();
            v6 = v68;
            v7 = 0x24BE1B000;
            v58 = v78;
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              sub_22AC85D90((uint64_t)v85, (uint64_t)v78);
            v64 = v75;
          }
          else
          {
            sub_22AC82A9C(1uLL);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              sub_22AC85DE0((uint64_t)v86, (uint64_t)v58);
            v6 = v68;
            v7 = 0x24BE1B000;
            v64 = v75;
            v63 = v45;
            v8 = v74;
          }

          v78 = v58;
          goto LABEL_39;
        }
LABEL_40:

        ++v8;
      }
      while (v6 != v8);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v89, 16);
      v6 = v66;
    }
    while (v66);
  }

}

void sub_22AC7CA70(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22AC7CA90(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_22AC7CAB0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_22AC7D2E0(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_checkInAndHandleAuthStatus);
}

void sub_22AC7D534(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B498F8;
  qword_255B498F8 = v1;

}

void sub_22AC7DB0C(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("tcrt")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("dCfg")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49908;
    qword_255B49908 = v2;

  }
}

uint64_t sub_22AC7DB80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  mach_port_t v3;
  uint64_t i;
  void *v5;
  NSObject *v6;
  id v7;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  uint64_t v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  id v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v0 = objc_msgSend(&unk_24F4DDAC0, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v0)
  {
    v1 = v0;
    v2 = *(_QWORD *)v14;
    v3 = *MEMORY[0x24BDD8B18];
    while (2)
    {
      for (i = 0; i != v1; ++i)
      {
        if (*(_QWORD *)v14 != v2)
          objc_enumerationMutation(&unk_24F4DDAC0);
        v5 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        sub_22AC82A9C(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v5;
          _os_log_impl(&dword_22AC64000, v6, OS_LOG_TYPE_DEFAULT, "Matching service %@", buf, 0xCu);
        }

        v7 = objc_retainAutorelease(v5);
        v8 = IOServiceMatching((const char *)objc_msgSend(v7, "UTF8String"));
        MatchingService = IOServiceGetMatchingService(v3, v8);
        if ((_DWORD)MatchingService)
        {
          v10 = MatchingService;
          sub_22AC82A9C(0);
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v7;
            _os_log_impl(&dword_22AC64000, v11, OS_LOG_TYPE_DEFAULT, "Found service %@", buf, 0xCu);
          }

          return v10;
        }
      }
      v1 = objc_msgSend(&unk_24F4DDAC0, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v1)
        continue;
      break;
    }
  }
  return 0;
}

void sub_22AC7E118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_22AC7E2AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22AC7E2CC(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  NSObject *v3;
  BOOL v4;
  uint8_t buf[4];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    v2 = 0;
    do
    {
      sub_22AC82A9C(0);
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v6 = v2;
        _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "Retry Count:%d", buf, 8u);
      }

      sleep(0xAu);
      result = objc_msgSend(*(id *)(v1 + 32), "copyComponentStatus");
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24))
        v4 = 1;
      else
        v4 = v2 >= 9;
      ++v2;
    }
    while (!v4);
  }
  return result;
}

void sub_22AC7E7D8()
{
  dispatch_semaphore_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;

  v0 = dispatch_semaphore_create(0);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair.preflightControl"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255B66A20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRemoteObjectInterface:", v2);

  objc_msgSend(v1, "resume");
  v3 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_22AC7E968;
  v13[3] = &unk_24F4D4DD0;
  v4 = v0;
  v14 = v4;
  objc_msgSend(v1, "remoteObjectProxyWithErrorHandler:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = sub_22AC7E9D0;
  v10[3] = &unk_24F4D4DF8;
  v11 = v1;
  v6 = v4;
  v12 = v6;
  v7 = v1;
  objc_msgSend(v5, "queryRepairDeltaWithReply:", v10);

  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    sub_22AC82A9C(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_22AC85EF8();

  }
}

void sub_22AC7E968(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  sub_22AC82A9C(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_22AC85F24((uint64_t)v3, v4);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_22AC7E9D0(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  id v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && !v8 && (a2 & 1) != 0)
  {
    v28 = a1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v29 = v7;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("key"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("identifier"));
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v16)
            v19 = v17 == 0;
          else
            v19 = 1;
          if (!v19)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v20)
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, v16);

            }
            v22 = objc_alloc(MEMORY[0x24BDD17C8]);
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v18, 0);
            v24 = (void *)objc_msgSend(v22, "initWithData:encoding:", v23, 4);

            objc_msgSend(v10, "objectForKeyedSubscript:", v16);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v24);

          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v12);
    }

    sub_22AC82A9C(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v10;
      _os_log_impl(&dword_22AC64000, v26, OS_LOG_TYPE_DEFAULT, "delta components: %@", buf, 0xCu);
    }

    v27 = qword_255B49918;
    qword_255B49918 = (uint64_t)v10;
    a1 = v28;
    v7 = v29;
    v9 = 0;
  }
  else
  {
    sub_22AC82A9C(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_22AC85F98(a2, (uint64_t)v9, v27);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_22AC7F0B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC7F480(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22AC81888(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("bCfg")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("LCfg")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49928;
    qword_255B49928 = v2;

  }
}

void sub_22AC81B00(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("FSCl")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("MSRk")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49938;
    qword_255B49938 = v2;

  }
}

void sub_22AC81D88(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("psd2")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("prpc")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49948;
    qword_255B49948 = v2;

  }
}

void *sub_22AC81EE4()
{
  NSObject *v0;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  sub_22AC82A9C(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 136315394;
    v3 = "-[CRUIAnalytics sendAnalyticsForRepairHistoryMismatch]_block_invoke";
    v4 = 2112;
    v5 = &unk_24F4DDAD8;
    _os_log_impl(&dword_22AC64000, v0, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v2, 0x16u);
  }

  return &unk_24F4DDAD8;
}

void sub_22AC8206C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v2, "appendString:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.mobilerepaird"));
  if ((objc_msgSend(v3, "BOOLForKey:", v2) & 1) == 0)
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = *(id *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    AnalyticsSendEventLazy();
    objc_msgSend(v3, "setBool:forKey:", 1, v2, v4, 3221225472, sub_22AC82158, &unk_24F4D4E60);
    objc_msgSend(v3, "synchronize");

  }
}

id sub_22AC82158(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("EventType");
  v9[1] = CFSTR("ModuleType");
  v1 = *(_QWORD *)(a1 + 40);
  v10[0] = *(_QWORD *)(a1 + 32);
  v10[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC82A9C(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CRUIAnalytics sendAsyncAnalyticsForEventIfNeeded:moduleName:]_block_invoke_2";
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_22AC64000, v3, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

void sub_22AC82468(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_255B49958;
  qword_255B49958 = v1;

}

void sub_22AC82A28(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(MEMORY[0x24BE27E68], "isFDRDataClassSupported:", CFSTR("CmCl")) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE27E68], "isFDRPropertySupported:", CFSTR("RCSn")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_255B49968;
    qword_255B49968 = v2;

  }
}

id sub_22AC82A9C(unint64_t a1)
{
  id v2;
  id v3;

  if (qword_255B49988[0] != -1)
    dispatch_once(qword_255B49988, &unk_24F4D4EA8);
  v2 = (id)MEMORY[0x24BDACB78];
  v3 = MEMORY[0x24BDACB78];
  if (a1 <= 1)
  {
    v2 = (id)qword_255B49978[a1];

  }
  return v2;
}

void sub_22AC82B18()
{
  os_log_t v0;
  void *v1;
  os_log_t v2;
  void *v3;

  v0 = os_log_create("com.apple.corerepair", "device");
  v1 = (void *)qword_255B49978[0];
  qword_255B49978[0] = (uint64_t)v0;

  v2 = os_log_create("com.apple.corerepair", "device-error");
  v3 = (void *)qword_255B49980;
  qword_255B49980 = (uint64_t)v2;

}

uint64_t sub_22AC82B74(void *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t inited;
  void **v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD aBlock[9];

  v4 = sub_22AC86124();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22AC8613C();
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22AC861C0();
  v44 = sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v11 = objc_msgSend(a1, sel_specifier);
  if (!v11)
    return swift_release();
  v12 = v11;
  v13 = objc_msgSend(v11, sel_target);
  v40 = v12;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v14 = (void *)swift_dynamicCastObjCClass();
  if (!v14)
  {
    swift_unknownObjectRelease();
LABEL_9:
    v38 = 0;
    v39 = 0;
    goto LABEL_10;
  }
  v39 = v14;
  v38 = objc_msgSend(v14, sel_navigationItem);
LABEL_10:
  v41 = v8;
  v42 = v5;
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v17 = (void *)objc_opt_self();
  v18 = (void *)sub_22AC86160();
  v19 = objc_msgSend(v17, sel_preferredFontForTextStyle_, v18);

  objc_msgSend(v16, sel_setFont_, v19);
  swift_release();
  swift_beginAccess();
  sub_22AC84828(&qword_255B49810);
  inited = swift_initStackObject();
  v21 = (void **)MEMORY[0x24BEBB368];
  *(_OWORD *)(inited + 16) = xmmword_22AC87FD0;
  v22 = *v21;
  *(_QWORD *)(inited + 32) = *v21;
  v23 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v24 = v22;
  v25 = objc_msgSend(v23, sel_labelColor);
  v26 = objc_msgSend(v25, sel_colorWithAlphaComponent_, a2);

  *(_QWORD *)(inited + 64) = sub_22AC84F04(0, &qword_255B49818);
  *(_QWORD *)(inited + 40) = v26;
  sub_22AC83148(inited);
  v27 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v28 = (void *)sub_22AC86160();
  swift_bridgeObjectRelease();
  type metadata accessor for Key();
  sub_22AC85058(&qword_255B49820, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22AC88160);
  v29 = (void *)sub_22AC86154();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend(v27, sel_initWithString_attributes_, v28, v29);

  objc_msgSend(v16, sel_setAttributedText_, v30);
  sub_22AC84F04(0, &qword_255B497F0);
  v31 = (void *)sub_22AC861D8();
  v32 = swift_allocObject();
  v33 = v38;
  *(_QWORD *)(v32 + 16) = v38;
  *(_QWORD *)(v32 + 24) = v16;
  aBlock[4] = sub_22AC84E0C;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22AC833A8;
  aBlock[3] = &unk_24F4D5098;
  v34 = _Block_copy(aBlock);
  v35 = v33;
  v36 = v16;
  sub_22AC86130();
  v45 = MEMORY[0x24BEE4AF8];
  sub_22AC85058(&qword_255B497F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  sub_22AC84828(&qword_255B49800);
  sub_22AC84EC4(&qword_255B49808, &qword_255B49800, MEMORY[0x24BEE12C8]);
  sub_22AC861F0();
  MEMORY[0x22E2E5474](0, v10, v7, v34);
  _Block_release(v34);

  (*(void (**)(char *, uint64_t))(v42 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v10, v41);
  swift_release();
  return swift_release();
}

unint64_t sub_22AC83148(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_22AC84828(&qword_255B49828);
  v2 = sub_22AC861FC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22AC84F90(v6, (uint64_t)&v13, &qword_255B49830);
    v7 = v13;
    result = sub_22AC84004(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_22AC84DD0(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22AC83274(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  sub_22AC84828(&qword_255B497E0);
  v2 = sub_22AC861FC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22AC84F90(v6, (uint64_t)&v15, &qword_255B497E8);
    v7 = v15;
    v8 = v16;
    result = sub_22AC84084(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22AC84DD0(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22AC833A8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22AC833D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  char *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char *v22;

  v0 = sub_22AC860E8();
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v22 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22AC84828(&qword_255B497D8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - v6;
  sub_22AC861C0();
  v21 = sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v9 = objc_msgSend(v8, sel_userInterfaceIdiom);

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE27EA0]), sel_init);
  if (!v9)
  {
LABEL_8:
    v14 = (void *)sub_22AC86160();
    v15 = (void *)sub_22AC86160();
    v13 = objc_msgSend(v10, sel_localizedStringWithKey_defaultString_, v14, v15);

    if (!v13)
      goto LABEL_16;
    goto LABEL_9;
  }
  v11 = (void *)sub_22AC86160();
  v12 = (void *)sub_22AC86160();
  v13 = objc_msgSend(v10, sel_localizedStringWithKey_defaultString_, v11, v12);

  if (!v13)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_9:
  sub_22AC86184();

  sub_22AC860DC();
  swift_bridgeObjectRelease();
  swift_release();
  sub_22AC84F90((uint64_t)v7, (uint64_t)v5, &qword_255B497D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v5, 1, v0) == 1)
  {
LABEL_14:
    sub_22AC84D90((uint64_t)v7);
    swift_release();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v22, v5, v0);
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v16)
  {
    v17 = v16;
    v18 = v22;
    v19 = (void *)sub_22AC860D0();
    sub_22AC83274(MEMORY[0x24BEE4AF8]);
    v20 = (void *)sub_22AC86154();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_openSensitiveURL_withOptions_, v19, v20);
    swift_release();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v18, v0);
    goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
}

id sub_22AC838D8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_22AC86160();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_22AC83C24()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22AC83C58(uint64_t a1, uint64_t a2)
{
  return sub_22AC83DA0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22AC83C64(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22AC8616C();
  *a2 = 0;
  return result;
}

uint64_t sub_22AC83CD8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22AC86178();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22AC83D54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22AC86184();
  v2 = sub_22AC86160();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22AC83D94(uint64_t a1, uint64_t a2)
{
  return sub_22AC83DA0(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22AC83DA0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22AC86184();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22AC83DDC()
{
  sub_22AC86184();
  sub_22AC86190();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AC83E1C()
{
  uint64_t v0;

  sub_22AC86184();
  sub_22AC86220();
  sub_22AC86190();
  v0 = sub_22AC8622C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22AC83E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22AC86184();
  v2 = v1;
  if (v0 == sub_22AC86184() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22AC86214();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22AC83F14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22AC86160();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22AC83F58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22AC86184();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22AC83F80()
{
  sub_22AC85058(&qword_255B49820, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22AC88160);
  sub_22AC85058(&qword_255B49858, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22AC880B4);
  return sub_22AC86208();
}

unint64_t sub_22AC84004(uint64_t a1)
{
  uint64_t v2;

  sub_22AC86184();
  sub_22AC86220();
  sub_22AC86190();
  v2 = sub_22AC8622C();
  swift_bridgeObjectRelease();
  return sub_22AC840E8(a1, v2);
}

unint64_t sub_22AC84084(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22AC86220();
  sub_22AC86190();
  v4 = sub_22AC8622C();
  return sub_22AC8425C(a1, a2, v4);
}

unint64_t sub_22AC840E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_22AC86184();
    v8 = v7;
    if (v6 == sub_22AC86184() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22AC86214();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_22AC86184();
          v15 = v14;
          if (v13 == sub_22AC86184() && v15 == v16)
            break;
          v18 = sub_22AC86214();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_22AC8425C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22AC86214() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22AC86214() & 1) == 0);
    }
  }
  return v6;
}

void sub_22AC8433C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32[5];
  _QWORD v33[2];

  v1 = v0;
  v30[0] = sub_22AC84828(&qword_255B49798);
  v31 = *(_QWORD *)(v30[0] - 8);
  MEMORY[0x24BDAC7A8](v30[0]);
  v3 = (char *)v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22AC861C0();
  v30[1] = sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  objc_msgSend(v0, sel_setSelectionStyle_, 0, v30[0]);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE27EA0]), sel_init);
  v5 = (void *)sub_22AC86160();
  v6 = (void *)sub_22AC86160();
  v7 = objc_msgSend(v4, sel_localizedStringWithKey_defaultString_, v5, v6);

  if (!v7)
  {
    __break(1u);
    goto LABEL_11;
  }
  v8 = swift_allocObject();
  v9 = sub_22AC86184();
  v11 = v10;

  *(_QWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 24) = v11;
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE27EA0]), sel_init);
  v13 = (void *)sub_22AC86160();
  v14 = (void *)sub_22AC86160();
  v15 = objc_msgSend(v12, sel_localizedStringWithKey_defaultString_, v13, v14);

  if (!v15)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  v16 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v17 = objc_msgSend(v16, sel_userInterfaceIdiom);

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE27EA0]), sel_init);
  if (v17)
  {
    v19 = (void *)sub_22AC86160();
    v20 = (void *)sub_22AC86160();
    v21 = objc_msgSend(v18, sel_localizedStringWithKey_defaultString_, v19, v20);

    if (v21)
    {
LABEL_9:
      v24 = sub_22AC86184();
      v26 = v25;

      v33[0] = v24;
      v33[1] = v26;
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = v1;
      *(_QWORD *)(v27 + 24) = v8;
      v28 = MEMORY[0x24BDAC7A8](v27);
      v30[-6] = v8 + 16;
      v30[-5] = v33;
      v30[-4] = sub_22AC848B8;
      v30[-3] = v28;
      v30[-2] = v1;
      v1;
      swift_retain();
      sub_22AC84828(&qword_255B497A0);
      sub_22AC84EC4(&qword_255B497A8, &qword_255B497A0, MEMORY[0x24BE855C0]);
      sub_22AC8610C();
      sub_22AC86118();
      v29 = v30[0];
      v32[3] = v30[0];
      v32[4] = sub_22AC84EC4(&qword_255B497B0, &qword_255B49798, MEMORY[0x24BDEFE98]);
      sub_22AC84A90(v32);
      sub_22AC86100();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v3, v29);
      MEMORY[0x22E2E545C](v32);
      swift_release();
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
  v22 = (void *)sub_22AC86160();
  v23 = (void *)sub_22AC86160();
  v21 = objc_msgSend(v18, sel_localizedStringWithKey_defaultString_, v22, v23);

  if (v21)
    goto LABEL_9;
LABEL_12:
  __break(1u);
}

uint64_t type metadata accessor for PartsAndServicePlacardCell()
{
  return objc_opt_self();
}

uint64_t sub_22AC84828(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2E5AC8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22AC84868()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22AC8488C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AC848B8(double a1)
{
  uint64_t v1;

  return sub_22AC82B74(*(void **)(v1 + 16), a1);
}

uint64_t sub_22AC848C0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 48);
  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_beginAccess();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  v2 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22AC84828(&qword_255B497B8);
  sub_22AC84EC4(&qword_255B497C0, &qword_255B497B8, MEMORY[0x24BEC6518]);
  sub_22AC86148();
  return swift_release();
}

uint64_t sub_22AC84A4C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2E5AD4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t *sub_22AC84A90(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22AC84ACC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22AC84AF4()
{
  id v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51A88]), sel_init);
  sub_22AC84828(&qword_255B497C8);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22AC87FD0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 11);
  v3 = sub_22AC84F04(0, &qword_255B497D0);
  *(_QWORD *)(v1 + 56) = v3;
  *(_QWORD *)(v1 + 32) = v2;
  v4 = (void *)sub_22AC8619C();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setSymbolColors_, v4);

  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_22AC87FD0;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, 7);
  *(_QWORD *)(v5 + 56) = v3;
  *(_QWORD *)(v5 + 32) = v6;
  v7 = (void *)sub_22AC8619C();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setEnclosureColors_, v7);

  v8 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v9 = v0;
  v10 = (void *)sub_22AC86160();
  objc_msgSend(v8, sel_initWithSymbolName_configuration_, v10, v9);

  sub_22AC860F4();
  swift_release();

  return swift_release();
}

uint64_t sub_22AC84D90(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22AC84828(&qword_255B497D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_22AC84DD0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22AC84DE0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_22AC84E0C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  sub_22AC861C0();
  sub_22AC861B4();
  sub_22AC861A8();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  if (v2)
    objc_msgSend(v2, sel_setTitleView_, v1);
  return swift_release();
}

uint64_t sub_22AC84EAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_22AC84EBC()
{
  return swift_release();
}

uint64_t sub_22AC84EC4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_22AC84A4C(a2);
    result = MEMORY[0x22E2E5AE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22AC84F04(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

void type metadata accessor for Key()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255B49838)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255B49838);
  }
}

uint64_t sub_22AC84F90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_22AC84828(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22AC84FD4()
{
  return sub_22AC85058(&qword_255B49840, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22AC88078);
}

uint64_t sub_22AC85000()
{
  return sub_22AC85058(&qword_255B49848, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22AC8804C);
}

uint64_t sub_22AC8502C()
{
  return sub_22AC85058(&qword_255B49850, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)"IЄ$TI");
}

uint64_t sub_22AC85058(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2E5AE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22AC8509C(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFAllocator *v27;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), (const void *)*MEMORY[0x24BDBD270]);
    MatchingServices = IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        v27 = v5;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = v27;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = v27;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

void sub_22AC854A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F2C0(&dword_22AC64000, a2, a3, "Error:%@", a5, a6, a7, a8, 2u);
}

void sub_22AC85508(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F2D0(&dword_22AC64000, a2, a3, "Failed to get battery health state (%x)\n", a5, a6, a7, a8, 0);
  sub_22AC6F2AC();
}

void sub_22AC8556C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F2D0(&dword_22AC64000, a2, a3, "Error retrieving current CPU uptime: %d", a5, a6, a7, a8, 0);
  sub_22AC6F2AC();
}

void sub_22AC855D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "CAA repair info mismatch with local Battery data", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC855FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "CAA repair info mismatch with local Display data", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "CAA repair info mismatch with local Camera data", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Invalid Certs or BIK", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85680(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F2C0(&dword_22AC64000, a2, a3, "Error getting BAA certs:%@", a5, a6, a7, a8, 2u);
}

void sub_22AC856E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Specifiers not found", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85714(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "componentName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s]Unable to get FDR path"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC73800();
  sub_22AC737D0(&dword_22AC64000, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);

  sub_22AC737F0();
}

void sub_22AC857C8(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "componentName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] unable to create sealer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC73800();
  sub_22AC737D0(&dword_22AC64000, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);

  sub_22AC737F0();
}

void sub_22AC8587C(uint64_t a1, _xpc_activity_s *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  xpc_activity_state_t state;

  objc_msgSend(*(id *)(a1 + 32), "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v12 = (uint64_t)a2;
  state = xpc_activity_get_state(a2);
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Failed to set state to DEFER for activity %@ current state: %lu"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC73800();
  sub_22AC737D0(&dword_22AC64000, v6, v7, "[%@][%@]", v8, v9, v10, v11, v12, state, 2u);

  sub_22AC737F0();
}

void sub_22AC85938()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  sub_22AC73828();
  sub_22AC73810(v2, v3, v4, 5.778e-34);
  sub_22AC737E4(&dword_22AC64000, v7, v5, "[%@][%@]", v6);

}

void sub_22AC85984(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  objc_msgSend(a1, "componentName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%s] ignoring rogue event with unlock countL: %ld"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC73800();
  sub_22AC737D0(&dword_22AC64000, v5, v6, "[%@][%@]", v7, v8, v9, v10, (uint64_t)"-[MRBaseComponentHandler sendAnalyticsForCount:]", v11, 2u);

  sub_22AC737F0();
}

void sub_22AC85A38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F29C(&dword_22AC64000, a1, a3, "Cannot find matching service to IOPlatformExpertDevice", a5, a6, a7, a8, 0);
}

void sub_22AC85A6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22AC6F29C(&dword_22AC64000, a1, a3, "Cannot find property \"config-number\"", a5, a6, a7, a8, 0);
}

void sub_22AC85AA0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22AC64000, log, OS_LOG_TYPE_ERROR, "Invalid time parameters", v1, 2u);
}

void sub_22AC85AE0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC7CA70(&dword_22AC64000, v2, v3, "failed to post followup error:%@", v4, v5, v6, v7, 2u);

  sub_22AC7CA84();
}

void sub_22AC85B5C(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_22AC64000, log, OS_LOG_TYPE_ERROR, "Unable to display %@ notification ERROR:%d", (uint8_t *)&v5, 0x12u);
}

void sub_22AC85BE8(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_22AC64000, a3, OS_LOG_TYPE_ERROR, "failed to open sensitive url:%@ :: error:%@", (uint8_t *)&v6, 0x16u);

}

void sub_22AC85C98(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC7CA70(&dword_22AC64000, v2, v3, "failed to clear Followup error:%@", v4, v5, v6, v7, 2u);

  sub_22AC7CA84();
}

void sub_22AC85D14(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AC7CA70(&dword_22AC64000, v2, v3, "failed to clear Followup notification:%@", v4, v5, v6, v7, 2u);

  sub_22AC7CA84();
}

void sub_22AC85D90(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)sub_22AC7CAB0(a1, a2), "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  sub_22AC7CA90(&dword_22AC64000, v5, v6, "failed to post followup error:%@");

  sub_22AC7CAA4();
}

void sub_22AC85DE0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)sub_22AC7CAB0(a1, a2), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  sub_22AC7CA90(&dword_22AC64000, v5, v6, "failed to clear Followup error:%@");

  sub_22AC7CAA4();
}

void sub_22AC85E30(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_22AC64000, a2, OS_LOG_TYPE_ERROR, "Unable to fetch Internal Component Auth Status:%d", (uint8_t *)v2, 8u);
  sub_22AC6F2AC();
}

void sub_22AC85EA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "IOREG Auth Component Timeout", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85ECC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "IOREG Auth Component Not Populated", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85EF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "queryRepairDelta timeout", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC85F24(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22AC64000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_22AC85F98(char a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_22AC64000, log, OS_LOG_TYPE_ERROR, "queryRepairDelta failed: %d. %@", (uint8_t *)v3, 0x12u);
}

void sub_22AC86020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Cannot find camera service", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC8604C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Audio failed with Speaker issue.", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC86078()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Audio failed with Codec issue.", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

void sub_22AC860A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22AC6F2B4();
  sub_22AC6F29C(&dword_22AC64000, v0, v1, "Cannot find matched camera service", v2, v3, v4, v5, v6);
  sub_22AC6F2AC();
}

uint64_t sub_22AC860D0()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22AC860DC()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22AC860E8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22AC860F4()
{
  return MEMORY[0x24BEC64F8]();
}

uint64_t sub_22AC86100()
{
  return MEMORY[0x24BDEFE60]();
}

uint64_t sub_22AC8610C()
{
  return MEMORY[0x24BDEFE70]();
}

uint64_t sub_22AC86118()
{
  return MEMORY[0x24BDF1508]();
}

uint64_t sub_22AC86124()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22AC86130()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22AC8613C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22AC86148()
{
  return MEMORY[0x24BE855A0]();
}

uint64_t sub_22AC86154()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22AC86160()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22AC8616C()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22AC86178()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22AC86184()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22AC86190()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22AC8619C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22AC861A8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22AC861B4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22AC861C0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22AC861CC()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_22AC861D8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22AC861E4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22AC861F0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22AC861FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22AC86208()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22AC86214()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22AC86220()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22AC8622C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AMFDRSealingMapGetFDRDataVersionForDevice()
{
  return MEMORY[0x24BED4388]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x24BE85860]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t DMCopyCurrentBuildVersion()
{
  return MEMORY[0x24BE2B5F8]();
}

uint64_t DMGetPreviousBuildVersion()
{
  return MEMORY[0x24BE2B600]();
}

uint64_t DMGetUserDataDisposition()
{
  return MEMORY[0x24BE2B608]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPSGetBatteryHealthState()
{
  return MEMORY[0x24BDD8818]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5770](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x24BDAD9B8](*(_QWORD *)&__clock_id, __tp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_task_isCurrentExecutor()
{
  return MEMORY[0x24BEE7250]();
}

uint64_t swift_task_reportUnexpectedExecutor()
{
  return MEMORY[0x24BEE7270]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

