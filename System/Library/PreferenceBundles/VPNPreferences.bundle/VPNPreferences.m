void sub_226978A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_226979628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_226979FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22697A27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VPNSettingsCopyLog()
{
  if (VPNSettingsCopyLog_onceToken != -1)
    dispatch_once(&VPNSettingsCopyLog_onceToken, &__block_literal_global);
  return (id)VPNSettingsCopyLog_logger;
}

void updateNEStatus(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "session");
    objc_msgSend(v2, "queue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2;
    ne_session_get_status();

  }
}

void __updateNEStatus_block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "timerSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "timerSource");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v3);

    objc_msgSend(*(id *)(a1 + 32), "setTimerSource:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "session");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 32);
  ne_session_get_info();

}

void __updateNEStatus_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t int64;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  dispatch_source_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  int v38;
  BOOL v39;
  _QWORD v40[4];
  id v41;
  int64_t v42;
  BOOL v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  _QWORD applier[4];
  id v48;
  _QWORD handler[4];
  NSObject *v50;
  _QWORD v51[2];
  _BYTE buf[24];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, "VPN");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      int64 = xpc_dictionary_get_int64(v5, "OnDemandAction");
    else
      int64 = 0;

  }
  else
  {
    int64 = 0;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "onDemandAction");
  if (v8 != int64)
    objc_msgSend(*(id *)(a1 + 32), "setOnDemandAction:", int64);
  v9 = MEMORY[0x24BDAC760];
  switch(*(_DWORD *)(a1 + 40))
  {
    case 1:
      v10 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_226973000, v10, OS_LOG_TYPE_DEFAULT, "%@ state is now Disconnected", buf, 0xCu);
      }

      if (v4)
      {
        xpc_dictionary_get_value(v4, "VPN");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = xpc_dictionary_get_int64(v12, "LastCause");
        }
        else
        {
          xpc_dictionary_get_value(v4, "IPSec");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_dictionary_get_value(v4, "PPP");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33;
          if (v33 || (v35 = v34) != 0)
            v14 = xpc_dictionary_get_int64(v35, "LastCause");
          else
            v14 = 0;

        }
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setLastStopCause:", v15);
      goto LABEL_39;
    case 2:
      v15 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v16;
      v17 = "%@ state is now Connecting";
      break;
    case 3:
      v18 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v19;
        _os_log_impl(&dword_226973000, v18, OS_LOG_TYPE_DEFAULT, "%@ state is now Connected", buf, 0xCu);
      }

      v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      objc_msgSend(*(id *)(a1 + 32), "setTimerSource:", v20);

      objc_msgSend(*(id *)(a1 + 32), "timerSource");
      v21 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v21, 0, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

      objc_msgSend(*(id *)(a1 + 32), "timerSource");
      v22 = objc_claimAutoreleasedReturnValue();
      handler[0] = v9;
      handler[1] = 3221225472;
      handler[2] = __updateNEStatus_block_invoke_16;
      handler[3] = &unk_24EE4DA98;
      v50 = *(id *)(a1 + 32);
      dispatch_source_set_event_handler(v22, handler);

      objc_msgSend(*(id *)(a1 + 32), "timerSource");
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_resume(v23);

      if (objc_msgSend(*(id *)(a1 + 32), "grade") == 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "subConnections");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeAllObjects");

        if (v4)
        {
          applier[0] = v9;
          applier[1] = 3221225472;
          applier[2] = __updateNEStatus_block_invoke_2_17;
          applier[3] = &unk_24EE4DAC0;
          v48 = *(id *)(a1 + 32);
          xpc_dictionary_apply(v4, applier);

        }
      }
      else
      {
        *(_QWORD *)buf = &stru_24EE4DF70;
        v45 = 0;
        v46 = &stru_24EE4DF70;
        v44 = 0;
        v43 = 0;
        v42 = 0;
        getExtendedStatusValues(v4, (void **)buf, (void **)&v46, &v45, &v44, &v43, &v42);
        objc_msgSend(*(id *)(a1 + 32), "setLastStopCause:", &unk_24EE55010);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v42);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setSessionConnectTime:", v27);

        v28 = *(void **)buf;
        v29 = (__CFString *)v46;
        v51[0] = *(_QWORD *)buf;
        v51[1] = v46;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 2);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setSessionIPAddresses:", v30);

        v31 = v45;
        objc_msgSend(*(id *)(a1 + 32), "setSessionRemoteAddress:", v45);
        objc_msgSend(*(id *)(a1 + 32), "setMatchDomains:", v44);
        objc_msgSend(*(id *)(a1 + 32), "setIsPrimary:", v43);

      }
      if (objc_msgSend(*(id *)(a1 + 32), "grade") == 7 || objc_msgSend(*(id *)(a1 + 32), "grade") == 8)
      {
        xpc_dictionary_get_array(v4, "SortedRelayErrors");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v9;
        v40[1] = 3221225472;
        v40[2] = __updateNEStatus_block_invoke_27;
        v40[3] = &unk_24EE4DAE8;
        v41 = *(id *)(a1 + 32);
        xpc_array_apply(v32, v40);

      }
      v15 = v50;
      goto LABEL_39;
    case 4:
      v15 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v25 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v25;
      v17 = "%@ state is now Reasserting";
      break;
    case 5:
      v15 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      v17 = "%@ state is now Disconnecting";
      break;
    default:
      goto LABEL_40;
  }
  _os_log_impl(&dword_226973000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
LABEL_39:

LABEL_40:
  v36[0] = v9;
  v36[1] = 3221225472;
  v36[2] = __updateNEStatus_block_invoke_34;
  v36[3] = &unk_24EE4DB10;
  v37 = *(id *)(a1 + 32);
  v38 = *(_DWORD *)(a1 + 40);
  v39 = v8 != int64;
  dispatch_async(MEMORY[0x24BDAC9B8], v36);

}

void __updateNEStatus_block_invoke_16(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", kNotificationVPNConnectionTimerFired, *(_QWORD *)(a1 + 32));

}

uint64_t __updateNEStatus_block_invoke_2_17(uint64_t a1, uint64_t a2, void *a3)
{
  int64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  int64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v17 = &stru_24EE4DF70;
  v18 = &stru_24EE4DF70;
  v15 = 0;
  v16 = &stru_24EE4DF70;
  getExtendedStatusValues(a3, (void **)&v18, (void **)&v17, (void **)&v16, 0, 0, &v15);
  v5 = v15;
  if (v15 <= 0)
  {
    v11 = (__CFString *)v16;
    v9 = (__CFString *)v17;
    v8 = (__CFString *)v18;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "subConnections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = kVPNSubConnectionInterfaceName;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    v20[1] = kVPNSubConnectionIPAddress;
    v9 = (__CFString *)v17;
    v8 = (__CFString *)v18;
    v19[0] = v18;
    v19[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)v16;
    v21[1] = v10;
    v21[2] = v16;
    v20[2] = kVPNSubConnectionRemoteAddress;
    v20[3] = kVPNSubConnectionConnectTime;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v13);

  }
  return 1;
}

void getExtendedStatusValues(void *a1, void **a2, void **a3, void **a4, void **a5, BOOL *a6, int64_t *a7)
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *string;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  const char *v36;
  void *v37;
  void **v38;
  void **v39;
  xpc_object_t xdict;
  _QWORD applier[5];

  v13 = a1;
  if (!v13)
    goto LABEL_24;
  v39 = a2;
  xdict = v13;
  xpc_dictionary_get_value(v13, "VPN");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(xdict, "IPv4");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(xdict, "IPv6");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(xdict, "DNSSupplementalMatchDomains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v38 = a3;
    xpc_dictionary_get_value(xdict, "IPSec");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(xdict, "PPP");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33)
    {
      *a7 = xpc_dictionary_get_int64(v33, "ConnectTime");
      v36 = "RemoteAddress";
      v37 = v33;
    }
    else
    {
      if (!v34)
      {
        string = 0;
LABEL_30:

        a3 = v38;
        if (!string)
          goto LABEL_5;
        goto LABEL_4;
      }
      *a7 = xpc_dictionary_get_int64(v34, "ConnectTime");
      v36 = "CommRemoteAddress";
      v37 = v35;
    }
    string = xpc_dictionary_get_string(v37, v36);
    goto LABEL_30;
  }
  *a7 = xpc_dictionary_get_int64(v14, "ConnectTime");
  string = xpc_dictionary_get_string(v14, "RemoteAddress");
  if (string)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string, v38);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *a4;
    *a4 = (void *)v19;

  }
LABEL_5:
  if (v15)
  {
    xpc_dictionary_get_value(v15, "Addresses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if (xpc_array_get_count(v21))
      {
        v23 = xpc_array_get_string(v22, 0);
        if (v23)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = *v39;
          *v39 = (void *)v24;

        }
      }
    }

  }
  if (v16)
  {
    xpc_dictionary_get_value(v16, "Addresses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if (xpc_array_get_count(v26))
      {
        v28 = xpc_array_get_string(v27, 0);
        if (v28)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v28);
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = *a3;
          *a3 = (void *)v29;

        }
      }
    }

  }
  if (a5 && v17 && xpc_array_get_count(v17))
  {
    v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v32 = *a5;
    *a5 = v31;

    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __getExtendedStatusValues_block_invoke;
    applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
    applier[4] = a5;
    xpc_array_apply(v17, applier);
  }
  if (a6)
    *a6 = xpc_dictionary_get_int64(xdict, "IsPrimaryInterface") != 0;

  v13 = xdict;
LABEL_24:

}

uint64_t __updateNEStatus_block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int64_t int64;
  uint64_t v6;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v4 = a3;
  if (MEMORY[0x2276A0C84]() == MEMORY[0x24BDACFA0] && (int64 = xpc_dictionary_get_int64(v4, "LastCause"), int64 >= 2))
  {
    v8 = int64;
    v9 = xpc_dictionary_get_double(v4, "TimeEpoch");
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11 - v9;

    if (v12 <= 300.0)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", (double)v8);
      objc_msgSend(*(id *)(a1 + 32), "setLastStopCause:", v13);

    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void __updateNEStatus_block_invoke_34(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setSession_status:", *(unsigned int *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", kNotificationVPNConnectionStatusChanged, *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(a1 + 44))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("VPNNEConfigurationChangedNotification"), *(_QWORD *)(a1 + 32));

  }
}

void sub_22697BCDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __getExtendedStatusValues_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *string_ptr;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (MEMORY[0x2276A0C84](v4) == MEMORY[0x24BDACFF0])
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        v7 = **(void ***)(a1 + 32);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string_ptr);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

      }
    }
  }

  return 1;
}

void sub_22697D818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22697DAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22697E80C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t compareConfigurationNamesNonLocalized(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "compare:", v5);
  return v6;
}

uint64_t compareConfigurationNames(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "localizedCaseInsensitiveCompare:", v5);
  return v6;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_226984C18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22698956C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2269897E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22698B004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22698B2D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22698C374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22698F3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFTypeRef VPNCopyAvailableCertificateIDs()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  OSStatus v5;
  CFTypeRef v6;
  CFTypeRef cf;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v0 = *MEMORY[0x24BDE9238];
  v1 = *MEMORY[0x24BDE94D0];
  v9[0] = *MEMORY[0x24BDE9220];
  v9[1] = v1;
  v2 = *MEMORY[0x24BDBD270];
  v10[0] = v0;
  v10[1] = v2;
  v3 = *MEMORY[0x24BDE8F50];
  v9[2] = *MEMORY[0x24BDE93B0];
  v9[3] = v3;
  v10[2] = &unk_24EE55190;
  v10[3] = CFSTR("com.apple.identities");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = SecItemCopyMatching(v4, &cf);
  v6 = cf;
  if (v5 && cf)
  {
    CFRelease(cf);
    v6 = 0;
    cf = 0;
  }

  return v6;
}

CFTypeRef VPNCopyAvailableCertificateObjects()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  OSStatus v5;
  CFTypeRef v6;
  CFTypeRef cf;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v0 = *MEMORY[0x24BDE9238];
  v1 = *MEMORY[0x24BDE94D8];
  v9[0] = *MEMORY[0x24BDE9220];
  v9[1] = v1;
  v2 = *MEMORY[0x24BDBD270];
  v10[0] = v0;
  v10[1] = v2;
  v3 = *MEMORY[0x24BDE8F50];
  v9[2] = *MEMORY[0x24BDE93B0];
  v9[3] = v3;
  v10[2] = &unk_24EE55190;
  v10[3] = CFSTR("com.apple.identities");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = SecItemCopyMatching(v4, &cf);
  v6 = cf;
  if (v5 && cf)
  {
    CFRelease(cf);
    v6 = 0;
    cf = 0;
  }

  return v6;
}

CFStringRef VPNCopyDisplayNameForCertificateWithPersistentID(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v5;
  OSStatus v6;
  CFStringRef v7;
  CFTypeRef v8;
  SecCertificateRef certificateRef;
  CFTypeRef result;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = *MEMORY[0x24BDE94D8];
    v12[0] = *MEMORY[0x24BDE9558];
    v12[1] = v3;
    v4 = *MEMORY[0x24BDBD270];
    v13[0] = v1;
    v13[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    certificateRef = 0;
    result = 0;
    v6 = SecItemCopyMatching(v5, &result);
    v7 = 0;
    v8 = result;
    if (!v6 && result)
    {
      v7 = 0;
      if (!SecIdentityCopyCertificate((SecIdentityRef)result, &certificateRef) && certificateRef)
        v7 = SecCertificateCopySubjectSummary(certificateRef);
      v8 = result;
    }
    if (v8)
    {
      CFRelease(v8);
      result = 0;
    }
    if (certificateRef)
      CFRelease(certificateRef);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
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

uint64_t SBSLaunchApplicationWithIdentifier()
{
  return MEMORY[0x24BEB0CA8]();
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5750](protocol);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x24BDF57B8](service, protocolType);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x24BDF58C8](prefs);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x24BDE88F8](certificate);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

uint64_t ne_session_cancel()
{
  return MEMORY[0x24BDAF028]();
}

uint64_t ne_session_create()
{
  return MEMORY[0x24BDAF030]();
}

uint64_t ne_session_get_info()
{
  return MEMORY[0x24BDAF038]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x24BDAF040]();
}

uint64_t ne_session_release()
{
  return MEMORY[0x24BDAF050]();
}

uint64_t ne_session_set_event_handler()
{
  return MEMORY[0x24BDAF060]();
}

uint64_t ne_session_start()
{
  return MEMORY[0x24BDAF070]();
}

uint64_t ne_session_stop()
{
  return MEMORY[0x24BDAF080]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

