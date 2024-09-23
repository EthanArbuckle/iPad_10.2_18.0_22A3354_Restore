id nplog_obj()
{
  if (nplog_obj_log_once != -1)
    dispatch_once(&nplog_obj_log_once, &__block_literal_global_9);
  return (id)nplog_obj_g_log;
}

void __nplog_obj_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkserviceproxy", "");
  v1 = (void *)nplog_obj_g_log;
  nplog_obj_g_log = (uint64_t)v0;

}

id NPGetInternalQueue()
{
  if (qword_1ED062A28 != -1)
    dispatch_once(&qword_1ED062A28, &__block_literal_global_174);
  return (id)qword_1ED062A20;
}

void sub_19E902C08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_19E9039C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
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

BOOL NetworkServiceProxyIsEnabled()
{
  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  return NetworkServiceProxyGetStatus() == 1;
}

uint64_t NetworkServiceProxyGetStatus()
{
  void *v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint8_t v7[16];
  uint8_t buf[16];

  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "currentNetworkHasProxies");

  if (v1)
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_INFO, "NSP is disabled because the current network has proxies", buf, 2u);
    }
    v3 = 3;
  }
  else
  {
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEnabled");

    if ((v5 & 1) != 0)
      return 1;
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      v3 = 2;
      _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_INFO, "NSP is disabled by the current configuration", v7, 2u);
    }
    else
    {
      v3 = 2;
    }
  }

  return v3;
}

void sub_19E9046E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void NetworkServiceProxyStart()
{
  +[NPTunnel initializeProtocol](NPTunnel, "initializeProtocol");
  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
}

NPFlowProperties *createPropertiesFromMetaData(void *a1)
{
  id v1;
  NPFlowProperties *v2;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v2 = -[NPFlowProperties initWithTLVData:]([NPFlowProperties alloc], "initWithTLVData:", v1)) == 0)
  {
    v2 = objc_alloc_init(NPFlowProperties);
  }

  return v2;
}

void sub_19E9047AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id createMetadataFromProperties(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = (void *)objc_msgSend(v1, "copyTLVData");
  else
    v3 = 0;

  return v3;
}

void sub_19E9047FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameForConnection(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_TCPConnectionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  createPropertiesFromMetaData(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  objc_msgSend(v6, "setServiceID:", serviceNameToID(v4));
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v4;
    v14 = 2048;
    v15 = objc_msgSend(v6, "serviceID");
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v12, 0x16u);
  }

  if (!objc_msgSend(v6, "timestamps"))
  {
    if (g_recordTimestamps)
    {
      v8 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      v9 = v8;
      if (v8)
      {
        v8[14] = 0;
        *((_OWORD *)v8 + 5) = 0u;
        *((_OWORD *)v8 + 6) = 0u;
        *((_OWORD *)v8 + 3) = 0u;
        *((_OWORD *)v8 + 4) = 0u;
        *((_OWORD *)v8 + 1) = 0u;
        *((_OWORD *)v8 + 2) = 0u;
        *(_OWORD *)v8 = 0u;
      }
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v6, "setTimestamps:", v9);
  }
  v10 = (uint64_t *)objc_msgSend(v6, "timestamps");
  if (v10 && g_recordTimestamps && !*v10)
    *v10 = mach_absolute_time();
  createMetadataFromProperties(v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v11);
  kdebug_trace();

}

void sub_19E904A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t serviceNameToID(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (const char *)objc_msgSend(v1, "UTF8String");
    v3 = (uint64_t)v2;
    if (v2)
    {
      strlen(v2);
      v3 = SipHash();
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_19E904AEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameForTask(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_TCPConnectionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  createPropertiesFromMetaData(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  objc_msgSend(v6, "setServiceID:", serviceNameToID(v4));
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v4;
    v11 = 2048;
    v12 = objc_msgSend(v6, "serviceID");
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v9, 0x16u);
  }

  createMetadataFromProperties(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v8);
  kdebug_trace();

}

void sub_19E904C78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetFallbackTimeout(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  objc_msgSend(v6, "_TCPConnectionMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  createPropertiesFromMetaData(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  objc_msgSend(v4, "setFallbackTimeout:", (double)a2);
  createMetadataFromProperties(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "set_TCPConnectionMetadata:", v5);

}

void sub_19E904D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetCurrentLocation(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a1;
  getSigningIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    getServerConnection();
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCurrentLatitude:longitude:timestamp:forClient:](v7, "setCurrentLatitude:longitude:timestamp:forClient:", v5, v6, a2, a3);
  }
  else
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "Failed to get the signing identifier, cannot set the current location", v8, 2u);
    }
  }

}

void sub_19E904E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getSigningIdentifier()
{
  if (qword_1ED062770 != -1)
    dispatch_once(&qword_1ED062770, &__block_literal_global_36);
  return (id)qword_1ED062768;
}

id getServerConnection()
{
  if (qword_1ED062760 != -1)
    dispatch_once(&qword_1ED062760, &__block_literal_global_34);
  return (id)qword_1ED062758;
}

uint64_t createObjectsFromDictionary()
{
  void *v0;
  NPWaldo **v1;
  NPWaldo **v2;
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NPWaldo *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  pid_t v23;
  void *v24;
  id v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  int *v35;
  char *v36;
  NPWaldo *v37;
  void *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  char *v42;
  int buffer;
  const __CFString *v44;
  uint64_t v45;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = v0;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    v12 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appRule"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v11 = 0;
      v12 = 0;
LABEL_44:
      v13 = 0;
      goto LABEL_45;
    }
    buffer = 138412290;
    v44 = CFSTR("appRule");
    v15 = "Failed to set the NSP configuration: dictionary is missing the %@ key";
LABEL_47:
    _os_log_error_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&buffer, 0xCu);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    buffer = 138412290;
    v44 = CFSTR("appRule");
    v15 = "Failed to set the NSP configuration: %@ key is not a dictionary";
    goto LABEL_47;
  }
  v39 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("app"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = (id)objc_msgSend(v40, "mutableCopy");
  else
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v10;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("label"));
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("bundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    getSigningIdentifier();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      nplog_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buffer) = 0;
        _os_log_error_impl(&dword_19E8FE000, v31, OS_LOG_TYPE_ERROR, "Failed to get the current process' signing identifier", (uint8_t *)&buffer, 2u);
      }

      goto LABEL_37;
    }
    v20 = (void *)v19;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("bundle"));

  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ExecutablePath"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v22 = objc_opt_isKindOfClass();

  if ((v22 & 1) != 0)
    goto LABEL_19;
  v23 = getpid();
  if (proc_pidpath(v23, &buffer, 0x1000u) <= 0)
  {
    nplog_obj();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 136315138;
      v42 = v36;
      _os_log_error_impl(&dword_19E8FE000, v32, OS_LOG_TYPE_ERROR, "Failed to get the current process' path: %s", buf, 0xCu);
    }

LABEL_37:
    v11 = 0;
    v12 = 0;
    v26 = 1;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &buffer);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("ExecutablePath"));

LABEL_19:
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("edgeSet"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      nplog_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        buffer = 138412290;
        v44 = CFSTR("edgeSet");
        _os_log_error_impl(&dword_19E8FE000, v30, OS_LOG_TYPE_ERROR, "Failed to set the NSP configuration: %@ key is not a dictionary", (uint8_t *)&buffer, 0xCu);
      }
      v11 = 0;
      v12 = 0;
      v26 = 1;
      goto LABEL_30;
    }
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("edges"));
  }
  objc_msgSend(v39, "setObject:forKeyedSubscript:", v16, CFSTR("app"));
  v25 = -[NSPAppRule initFromDictionary:]([NSPAppRule alloc], "initFromDictionary:", v39);
  v12 = v25;
  v11 = 0;
  v26 = v25 == 0;
  if (!v38 || !v25)
    goto LABEL_42;
  v37 = [NPWaldo alloc];
  objc_msgSend(v12, "matchSigningIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NPWaldo initWithIdentifier:timestamp:fromDictionary:source:](v37, "initWithIdentifier:timestamp:fromDictionary:source:", v27, &unk_1E41514B0, v38, 2);

  if (!v11)
  {
    nplog_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer) = 0;
      _os_log_error_impl(&dword_19E8FE000, v33, OS_LOG_TYPE_ERROR, "Invalid edge set, disabling app rule", (uint8_t *)&buffer, 2u);
    }

    v11 = 0;
    objc_msgSend(v12, "setEnabled:", MEMORY[0x1E0C9AAA0]);
    goto LABEL_41;
  }
  objc_msgSend(v12, "requireTFO");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v29)
  {
LABEL_41:
    v26 = 0;
    goto LABEL_42;
  }
  objc_msgSend(v12, "requireTFO");
  v30 = objc_claimAutoreleasedReturnValue();
  -[NPWaldo setRequireTFO:](v11, "setRequireTFO:", v30);
  v26 = 0;
LABEL_30:

LABEL_42:
LABEL_43:

  if (v26)
    goto LABEL_44;
LABEL_7:
  v12 = objc_retainAutorelease(v12);
  *v4 = v12;
  v11 = objc_retainAutorelease(v11);
  *v2 = v11;
  v13 = 1;
LABEL_45:

  return v13;
}

void sub_19E905550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

uint64_t NetworkServiceProxySetCurrentConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
}

BOOL NetworkServiceProxyEnableForSessionTask(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  id v7;
  id v8;
  __CFHTTPMessage *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  CFDataRef v15;
  void *v16;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint8_t v27[16];

  v1 = a1;
  objc_msgSend(v1, "_TCPConnectionMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  kdebug_trace();
  createPropertiesFromMetaData(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnableNSP:", 1);
  if (!objc_msgSend(v3, "timestamps"))
  {
    if (g_recordTimestamps)
    {
      v4 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      v5 = v4;
      if (v4)
      {
        v4[14] = 0;
        *((_OWORD *)v4 + 5) = 0u;
        *((_OWORD *)v4 + 6) = 0u;
        *((_OWORD *)v4 + 3) = 0u;
        *((_OWORD *)v4 + 4) = 0u;
        *((_OWORD *)v4 + 1) = 0u;
        *((_OWORD *)v4 + 2) = 0u;
        *(_OWORD *)v4 = 0u;
      }
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v3, "setTimestamps:", v5);
  }
  v6 = (uint64_t *)objc_msgSend(v3, "timestamps");
  if (v6 && g_recordTimestamps && !*v6)
    *v6 = mach_absolute_time();
  if ((objc_msgSend(v1, "_preconnect") & 1) == 0)
  {
    objc_msgSend(v1, "originalRequest");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v8 = objc_retainAutorelease(v7), objc_msgSend(v8, "_CFURLRequest"))
      && (v9 = (__CFHTTPMessage *)CFURLRequestCopyHTTPRequest()) != 0)
    {
      v10 = v8;
      objc_msgSend(v10, "allHTTPHeaderFields");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Host"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "length"))
      {
        objc_msgSend(v10, "URL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "host");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (-[__CFString length](v14, "length"))
        {
          v12 = v14;
          CFHTTPMessageSetHeaderFieldValue(v9, CFSTR("Host"), v14);
        }
        else
        {
          nplog_obj();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v27 = 0;
            _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "Failed to derive the request Host: header", v27, 2u);
          }

          v12 = v14;
        }
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Accept"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (!v20)
        CFHTTPMessageSetHeaderFieldValue(v9, CFSTR("Accept"), CFSTR("*/*"));
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Accept-Language"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "length");

      if (!v22)
      {
        if (qword_1ED062788 != -1)
          dispatch_once(&qword_1ED062788, &__block_literal_global_56);
        CFHTTPMessageSetHeaderFieldValue(v9, CFSTR("Accept-Language"), (CFStringRef)qword_1ED062780);
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Accept-Encoding"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (!v24)
        CFHTTPMessageSetHeaderFieldValue(v9, CFSTR("Accept-Encoding"), CFSTR("br, gzip, deflate"));
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("keep-alive"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "length");

      if (!v26)
        CFHTTPMessageSetHeaderFieldValue(v9, CFSTR("Connection"), CFSTR("keep-alive"));

      v15 = CFHTTPMessageCopySerializedMessage(v9);
      CFRelease(v9);
    }
    else
    {
      v15 = 0;
    }

    if (v15)
      objc_msgSend(v3, "setRequestData:", v15);

  }
  createMetadataFromProperties(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v1, "set_TCPConnectionMetadata:", v16);

  return v16 != 0;
}

void sub_19E905A38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void NetworkServiceProxyEnableInParameters(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const void *bytes_ptr;
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  id v11;
  xpc_object_t v12;
  id v13;

  v13 = a1;
  v1 = (void *)nw_parameters_copy_metadata();
  if (qword_1ED062778 != -1)
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
  objc_msgSend(CFSTR("com.apple.NetworkServiceProxy"), "UTF8String");
  nw_parameters_set_account_id();
  if (v1 && MEMORY[0x1A1AEADA0](v1) == MEMORY[0x1E0C812E8])
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D50]);
    bytes_ptr = xpc_data_get_bytes_ptr(v1);
    v2 = (void *)objc_msgSend(v3, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v1), 0);
  }
  else
  {
    v2 = 0;
  }
  createPropertiesFromMetaData(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnableNSP:", 1);
  if (!objc_msgSend(v5, "timestamps"))
  {
    if (g_recordTimestamps)
    {
      v6 = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
      v7 = v6;
      if (v6)
      {
        v6[14] = 0;
        *((_OWORD *)v6 + 5) = 0u;
        *((_OWORD *)v6 + 6) = 0u;
        *((_OWORD *)v6 + 3) = 0u;
        *((_OWORD *)v6 + 4) = 0u;
        *((_OWORD *)v6 + 1) = 0u;
        *((_OWORD *)v6 + 2) = 0u;
        *(_OWORD *)v6 = 0u;
      }
    }
    else
    {
      v7 = 0;
    }
    objc_msgSend(v5, "setTimestamps:", v7);
  }
  v8 = (uint64_t *)objc_msgSend(v5, "timestamps");
  if (v8 && g_recordTimestamps && !*v8)
    *v8 = mach_absolute_time();
  createMetadataFromProperties(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = xpc_data_create((const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
    nw_parameters_set_metadata();

  }
}

void sub_19E905CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void NetworkServiceProxySetServiceNameInParameters(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const void *bytes_ptr;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  xpc_object_t v15;
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = nw_parameters_copy_metadata();
  v6 = (void *)v5;
  if (qword_1ED062778 == -1)
  {
    if (!v5)
    {
LABEL_4:
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    dispatch_once(&qword_1ED062778, &__block_literal_global_37);
    if (!v6)
      goto LABEL_4;
  }
  if (MEMORY[0x1A1AEADA0](v6) != MEMORY[0x1E0C812E8])
    goto LABEL_4;
  v8 = objc_alloc(MEMORY[0x1E0C99D50]);
  bytes_ptr = xpc_data_get_bytes_ptr(v6);
  v7 = (void *)objc_msgSend(v8, "initWithBytesNoCopy:length:freeWhenDone:", bytes_ptr, xpc_data_get_length(v6), 0);
LABEL_6:
  createPropertiesFromMetaData(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setServiceID:", serviceNameToID(v4));
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412546;
    v17 = v4;
    v18 = 2048;
    v19 = objc_msgSend(v10, "serviceID");
    _os_log_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEFAULT, "Setting service name to %@ (%llu)", (uint8_t *)&v16, 0x16u);
  }

  createMetadataFromProperties(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = objc_retainAutorelease(v12);
    v15 = xpc_data_create((const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
    nw_parameters_set_metadata();

  }
}

void sub_19E905F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

BOOL NetworkServiceProxySetRemoteEndpointsForSessionTask(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NPTunnelTuscanyEndpoint *v6;
  NPTunnelTuscanyEndpoint *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NPTunnelTuscanyEndpoint *v11;
  NSObject *v12;
  _BOOL8 v13;
  void *v14;
  NSObject *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_TCPConnectionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v11 = 0;
    goto LABEL_9;
  }
  v6 = -[NPTunnelTuscanyEndpoint initWithHosts:]([NPTunnelTuscanyEndpoint alloc], "initWithHosts:", v4);
  v7 = v6;
  if (v6)
  {
    -[NPTunnelTuscanyEndpoint hosts](v6, "hosts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = objc_msgSend(v4, "count");

    if (v9 == v10)
    {
      v11 = v7;
LABEL_9:
      +[NPTunnel initializeProtocol](NPTunnel, "initializeProtocol");
      createPropertiesFromMetaData(v5);
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject setReplacementEndpoint:](v12, "setReplacementEndpoint:", v11);
      createMetadataFromProperties(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v14 != 0;
      if (v14)
      {
        objc_msgSend(v3, "set_TCPConnectionMetadata:", v14);
      }
      else
      {
        nplog_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v17) = 0;
          _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Failed to create meta-data from properties in NetworkServiceProxySetRemoteEndpointsForSessionTask", (uint8_t *)&v17, 2u);
        }

      }
      v7 = v11;
      goto LABEL_15;
    }
  }
  nplog_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v17 = 138412290;
    v18 = v4;
    _os_log_error_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_ERROR, "Invalid endpoints passed to NetworkServiceProxySetRemoteEndpointsForSessionTask: %@", (uint8_t *)&v17, 0xCu);
  }
  v13 = 0;
LABEL_15:

  return v13;
}

void sub_19E9061A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t NetworkServiceProxySetRemoteAddressMapForSessionTask(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  NSObject *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v22 = a2;
  objc_msgSend(v3, "_TCPConnectionMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v22;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v6)
  {
    v25 = v4;
    v26 = *(_QWORD *)v32;
    v24 = v3;
LABEL_3:
    v23 = v6;
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v26)
        objc_enumerationMutation(v5);
      v8 = *(NSObject **)(*((_QWORD *)&v31 + 1) + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        nplog_obj();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v8;
          v37 = 2112;
          v38 = v9;
          _os_log_error_impl(&dword_19E8FE000, v21, OS_LOG_TYPE_ERROR, "Set of addresses in address map for hostname %@ is not an NSSet: (%@)", buf, 0x16u);
        }

        goto LABEL_33;
      }
      v10 = v5;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v11 = v9;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v28;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v11);
            v15 = *(NSObject **)(*((_QWORD *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              nplog_obj();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v36 = v15;
                v37 = 2112;
                v38 = v8;
                _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "Address (%@) in address map for hostname %@ is not a string", buf, 0x16u);
              }

              v3 = v24;
              v4 = v25;
              v5 = v10;

              v17 = 0;
              v9 = v11;
              goto LABEL_23;
            }
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v12)
            continue;
          break;
        }
      }

      v3 = v24;
      v4 = v25;
      v5 = v10;

      if (++v7 == v23)
      {
        v6 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    nplog_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v8;
      _os_log_error_impl(&dword_19E8FE000, v9, OS_LOG_TYPE_ERROR, "Hostname (%@) in addressMap parameter is not a string", buf, 0xCu);
    }
LABEL_33:
    v17 = 0;
LABEL_23:
    v16 = v5;
    goto LABEL_24;
  }
LABEL_18:

  +[NPTunnel initializeProtocol](NPTunnel, "initializeProtocol");
  createPropertiesFromMetaData(v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setReplacementAddressMap:", v5);
  createMetadataFromProperties(v16);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "set_TCPConnectionMetadata:", v9);
    v17 = 1;
  }
  else
  {
    nplog_obj();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v20, OS_LOG_TYPE_ERROR, "Failed to create meta-data from properties in NetworkServiceProxySetRemoteEndpointMapForSessionTask", buf, 2u);
    }

    v9 = 0;
    v17 = 0;
  }
LABEL_24:

  return v17;
}

void sub_19E90660C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t myIsEqual(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqual:", v4);
  else
    v5 = 1;

  return v5;
}

void sub_19E906704(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id copySystemVersionDictionary()
{
  if (qword_1ED062750 != -1)
    dispatch_once(&qword_1ED062750, &__block_literal_global);
  return (id)_MergedGlobals_28;
}

void __copySystemVersionDictionary_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = _CFCopySystemVersionDictionary();
  v1 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = v0;

}

id copyOSNameString()
{
  return (id)MGCopyAnswer();
}

id copyOSVersionString()
{
  return (id)MGCopyAnswer();
}

id copyOSBuildString()
{
  void *v0;
  void *v1;

  copySystemVersionDictionary();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9AB90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_19E9067FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id copyProductTypeString()
{
  return (id)MGCopyAnswer();
}

uint64_t deviceClassIsHomepod()
{
  return 0;
}

void __getServerConnection_block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NSPServerClient initWithCallbackQueue:]([NSPServerClient alloc], 0);
  v1 = (void *)qword_1ED062758;
  qword_1ED062758 = (uint64_t)v0;

}

id latitudeLongitudeToGeohash(unint64_t a1, double a2, double a3)
{
  unint64_t v3;
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  void *v20;
  NSObject *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;

  v3 = a1;
  v25 = *MEMORY[0x1E0C80C00];
  if (a1 > 0xC)
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v23 = 134217984;
      v24 = v3;
      _os_log_error_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_ERROR, "Geohash length is too big (%lu), maximum is 12", (uint8_t *)&v23, 0xCu);
    }

    return 0;
  }
  v5 = 0;
  v6 = 1 << (5 * a1 - 1);
  v7 = 90.0;
  v8 = -180.0;
  v9 = 180.0;
  v10 = -90.0;
  do
  {
    v11 = v8 + (v9 - v8) * 0.5;
    if (v11 <= a3)
      v12 = v6;
    else
      v12 = 0;
    v5 |= v12;
    if (v6 == 1)
      break;
    if (v11 <= a3)
      v8 = v8 + (v9 - v8) * 0.5;
    else
      v9 = v8 + (v9 - v8) * 0.5;
    v13 = v6 >> 1;
    if (v10 + (v7 - v10) * 0.5 <= a2)
    {
      v10 = v10 + (v7 - v10) * 0.5;
    }
    else
    {
      v7 = v10 + (v7 - v10) * 0.5;
      v13 = 0;
    }
    v5 |= v13;
    v14 = v6 > 3;
    v6 >>= 2;
  }
  while (v14);
  v15 = a1 + 1;
  v16 = malloc_type_malloc(a1 + 1, 0xC1886358uLL);
  if (!v16)
  {
    nplog_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = 134217984;
      v24 = v15;
      _os_log_error_impl(&dword_19E8FE000, v22, OS_LOG_TYPE_ERROR, "Failed to allocate %lu bytes for the geohash", (uint8_t *)&v23, 0xCu);
    }

    return 0;
  }
  v17 = v16;
  bzero(v16, v3 + 1);
  if (v3)
  {
    v18 = 5 * v3 - 5;
    v19 = v17;
    do
    {
      *v19++ = a0123456789bcde[(v5 >> v18) & 0x1F];
      v18 -= 5;
      --v3;
    }
    while (v3);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v17, 4);
  free(v17);
  return v20;
}

BOOL geohashToLatitudeLongitude(void *a1, double *a2, double *a3)
{
  id v5;
  const char *v6;
  char v7;
  size_t v8;
  size_t v9;
  _BYTE *v10;
  uint64_t v11;
  size_t v12;
  char v13;
  _BOOL8 v14;
  NSObject *v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  int v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = (const char *)objc_msgSend(v5, "UTF8String");
  v7 = strlen(v6);
  *a3 = 0.0;
  *a2 = 0.0;
  v8 = strlen(v6);
  if (!v8)
  {
    v11 = 0;
LABEL_12:
    v16 = 1 << (5 * v7 - 1);
    v17 = -90.0;
    v18 = 90.0;
    v19 = -180.0;
    v20 = 180.0;
    do
    {
      if ((v16 & v11) != 0)
        v19 = v19 + (v20 - v19) * 0.5;
      else
        v20 = v19 + (v20 - v19) * 0.5;
      if (v16 == 1)
        break;
      if ((v11 & (v16 >> 1)) != 0)
        v17 = v17 + (v18 - v17) * 0.5;
      else
        v18 = v17 + (v18 - v17) * 0.5;
      v21 = v16 > 3;
      v16 >>= 2;
    }
    while (v21);
    *a3 = v19 + (v19 - v20) * 0.5;
    *a2 = v17 + (v17 - v18) * 0.5;
    v14 = 1;
    goto LABEL_22;
  }
  v9 = v8;
  v10 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", *v6, 0x21uLL);
  if (v10)
  {
    v11 = 0;
    v12 = 0;
    v13 = 5 * v7 - 5;
    while (1)
    {
      v11 |= (v10 - "0123456789bcdefghjkmnpqrstuvwxyz") << v13;
      if (v9 - 1 == v12)
        goto LABEL_12;
      v10 = memchr("0123456789bcdefghjkmnpqrstuvwxyz", v6[v12 + 1], 0x21uLL);
      v13 -= 5;
      ++v12;
      if (!v10)
      {
        v14 = v12 >= v9;
        goto LABEL_9;
      }
    }
  }
  v12 = 0;
  v14 = 0;
LABEL_9:
  nplog_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v23 = v6[v12];
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    v26 = 1024;
    v27 = v23;
    _os_log_error_impl(&dword_19E8FE000, v15, OS_LOG_TYPE_ERROR, "Invalid character in geohash %@: %c", buf, 0x12u);
  }

LABEL_22:
  return v14;
}

void sub_19E906CD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t getRTTFromFrame(void *a1)
{
  id v1;
  NSObject *v2;
  unsigned int v3;
  unint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") <= 7)
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v1, "length");
      _os_log_error_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_ERROR, "Received data is less than an RTT-frame: %lu", (uint8_t *)&v6, 0xCu);
    }

    goto LABEL_8;
  }
  v3 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v1), "bytes");
  if (!v3)
  {
LABEL_8:
    v4 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }
  if (v3 >= 0x3E8)
    v4 = (unint64_t)((double)v3 / 1000.0);
  else
    v4 = 1;
LABEL_9:

  return v4;
}

void sub_19E906E00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __getSigningIdentifier_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFStringRef v2;
  void *v3;
  CFErrorRef v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    error = 0;
    v2 = SecTaskCopySigningIdentifier(v0, &error);
    v3 = (void *)qword_1ED062768;
    qword_1ED062768 = (uint64_t)v2;

    if (qword_1ED062768)
    {
LABEL_11:
      if (error)
        CFRelease(error);
      CFRelease(v1);
      return;
    }
    v4 = error;
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v13 = error;
        v7 = "Failed to obtain the signing identifier: %@";
        v8 = v5;
        v9 = 12;
LABEL_15:
        _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      }
    }
    else if (v6)
    {
      *(_WORD *)buf = 0;
      v7 = "Failed to obtain the signing identifier";
      v8 = v5;
      v9 = 2;
      goto LABEL_15;
    }

    goto LABEL_11;
  }
  nplog_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a SecTask for self", buf, 2u);
  }

}

uint64_t getDesignatedRequirement()
{
  return 0;
}

void logHTTPRequestData(void *a1)
{
  id v1;
  NSObject *v2;
  _BOOL4 v3;
  size_t v4;
  _BYTE *v5;
  NSObject *v6;
  int v7;
  _BYTE *v8;
  _BYTE __dst[1000];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  nplog_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);

  if (v3)
  {
    if ((unint64_t)objc_msgSend(v1, "length") > 0x3E7)
      v4 = 1000;
    else
      v4 = objc_msgSend(v1, "length");
    bzero(__dst, 0x3E8uLL);
    memcpy(__dst, (const void *)objc_msgSend(objc_retainAutorelease(v1), "bytes"), v4);
    if (v4)
    {
      v5 = __dst;
      do
      {
        if ((char)*v5 <= 31)
          *v5 = 32;
        ++v5;
        --v4;
      }
      while (v4);
    }
    nplog_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = 136315138;
      v8 = __dst;
      _os_log_debug_impl(&dword_19E8FE000, v6, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v7, 0xCu);
    }

  }
}

void sub_19E9070EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL30NetworkServiceProxyInitializerv_block_invoke()
{
  id v0;

  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "start");

}

void sub_19E907140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL28getHTTPPreferredLanguageCodev_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  const void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), (CFStringRef)*MEMORY[0x1E0C9B248]);
  if (v0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v0, "count"))
      {
        objc_msgSend(v0, "objectAtIndexedSubscript:", 0);
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v2 = v1;
          if (!CFBundleGetLocalizationInfoForLocalization()
            || (v3 = (void *)CFBundleCopyLocalizationForLocalizationInfo(), (v4 = v3) == 0)
            || (v5 = (void *)objc_msgSend(v3, "mutableCopy"), CFRelease(v4), !v5))
          {
            v5 = (void *)objc_msgSend(v2, "mutableCopy");
          }
          if ((unint64_t)objc_msgSend(v5, "length") >= 4)
            objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR("-"), 0, 0, objc_msgSend(v5, "length"));
          objc_msgSend(v5, "lowercaseString");
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("ru-ru")))
          {

            v6 = CFSTR("ru");
          }

          v7 = (void *)qword_1ED062780;
          qword_1ED062780 = (uint64_t)v6;

        }
      }
    }
  }
  if (!qword_1ED062780)
    qword_1ED062780 = (uint64_t)CFSTR("en");

}

void sub_19E907330(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19E9078D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

__int128 *np_loopback_protocol_get_id()
{
  if (_MergedGlobals_29 != -1)
    dispatch_once(&_MergedGlobals_29, &__block_literal_global_0);
  return &xmmword_1ED062798;
}

void __np_loopback_protocol_get_id_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  unk_1ED062890 = 0u;
  unk_1ED062880 = 0u;
  *(_OWORD *)&qword_1ED062870 = 0u;
  unk_1ED062860 = 0u;
  unk_1ED062850 = 0u;
  unk_1ED062840 = 0u;
  unk_1ED062830 = 0u;
  *(_OWORD *)&qword_1ED062820 = 0u;
  *(_OWORD *)&qword_1ED062810 = 0u;
  unk_1ED062800 = 0u;
  unk_1ED0627F0 = 0u;
  *(_OWORD *)&qword_1ED0627E0 = 0u;
  unk_1ED0627D0 = 0u;
  xmmword_1ED0628B0 = 0u;
  unk_1ED0628C0 = 0u;
  xmmword_1ED0628A0 = 0u;
  xmmword_1ED0627C0 = 0u;
  qword_1ED0627B8 = 0;
  xmmword_1ED062798 = 0u;
  unk_1ED0627A8 = 0u;
  __strlcpy_chk();
  qword_1ED0627B8 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(_QWORD *)&xmmword_1ED0627C0 = np_loopback_add_input_handler;
  *((_QWORD *)&xmmword_1ED0627C0 + 1) = np_loopback_remove_input_handler;
  qword_1ED062810 = (uint64_t)np_loopback_get_input_frames;
  unk_1ED062818 = np_loopback_get_output_frames;
  qword_1ED062820 = (uint64_t)np_loopback_finalize_output_frames;
  qword_1ED062870 = (uint64_t)np_loopback_supports_external_data;
  qword_1ED062898 = (uint64_t)np_loopback_waiting_for_output;
  qword_1ED0627F8 = (uint64_t)np_loopback_error;
  qword_1ED0627D8 = (uint64_t)np_loopback_connect;
  qword_1ED0627E0 = (uint64_t)np_loopback_disconnect;
  unk_1ED0627E8 = np_loopback_connected;
  if ((nw_protocol_register_extended() & 1) == 0)
  {
    nplog_obj();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v1 = 0;
      _os_log_error_impl(&dword_19E8FE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel_flow protocol", v1, 2u);
    }

  }
}

uint64_t np_loopback_add_input_handler(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 40);
  *(_QWORD *)(a2 + 32) = a1;
  *(_QWORD *)(a1 + 48) = a2;
  v4 = v3;
  uuid_copy((unsigned __int8 *)objc_msgSend(v4, "protocol"), (const unsigned __int8 *)a2);

  return 1;
}

BOOL np_loopback_remove_input_handler(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v7;
  void *v8;

  *(_QWORD *)(a2 + 32) = 0;
  v4 = a1[6];
  if (v4 == a2)
  {
    a1[6] = 0;
    v7 = a1[4];
    if (v7)
      (*(void (**)(void))(*(_QWORD *)(v7 + 24) + 8))();
    if (a3)
    {
      v8 = (void *)a1[5];
      objc_msgSend(v8, "handleDetachedFromProtocol");
      a1[5] = 0;

    }
  }
  return v4 == a2;
}

uint64_t np_loopback_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 40), "addInputFramesToArray:maximumBytes:minimumBytes:maximumFrameCount:", a6, a4, a3, a5);
}

uint64_t np_loopback_get_output_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 40), "addOutputFramesToArray:maximumBytes:minimumBytes:maximumFrameCount:", a6, a4, a3, a5);
}

uint64_t np_loopback_finalize_output_frames(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  nw_frame_array_foreach();
  objc_msgSend(v1, "notifyInputHandler");

  return 1;
}

uint64_t np_loopback_supports_external_data(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) + 176))();
}

uint64_t np_loopback_waiting_for_output(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "waitingForOutput");
}

uint64_t np_loopback_connected(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(result + 48) + 24) + 40))();
  return result;
}

uint64_t np_loopback_error(uint64_t result)
{
  if (result)
  {
    result = *(_QWORD *)(result + 48);
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 24) + 56))();
  }
  return result;
}

uint64_t np_loopback_connect(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v7;

  v2 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setWaitingForOutput:", 1);
  (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 112))(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)nw_parameters_copy_context();
  v7 = v2;
  v5 = v2;
  nw_queue_context_async();

  return 1;
}

void np_loopback_disconnect(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 112))(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)nw_parameters_copy_context();
  v6 = v2;
  v5 = v2;
  nw_queue_context_async();

}

uint64_t np_loopback_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NPTuscanyLoopbackConnection *v6;
  NPTuscanyLoopbackConnection *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  if (_MergedGlobals_29 != -1)
    dispatch_once(&_MergedGlobals_29, &__block_literal_global_0);
  if (nw_protocols_are_equal()
    && (v6 = objc_alloc_init(NPTuscanyLoopbackConnection)) != 0)
  {
    v7 = v6;
    *(_QWORD *)(-[NPTuscanyLoopbackConnection protocol](v7, "protocol") + 40) = v7;
    v8 = -[NPTuscanyLoopbackConnection protocol](v7, "protocol");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void np_loopback_output_frame_finalizer(void *a1, int a2, void *a3)
{
  if (a2)
    objc_msgSend(a3, "handleOutputFrame:", a1);
  else
    np_loopback_input_frame_finalizer(a1);
}

void sub_19E908FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void np_loopback_input_frame_finalizer(void *a1)
{
  id v1;
  void *buffer;

  v1 = a1;
  buffer = (void *)nw_frame_get_buffer();
  nw_frame_reset();

  free(buffer);
}

uint64_t __np_loopback_finalize_output_frames_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  nw_frame_array_remove();
  nw_frame_finalize();

  return 1;
}

uint64_t __np_loopback_connect_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "protocol");
  if (*(_QWORD *)(result + 48))
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "protocol")+ 48)+ 24)+ 40))(*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "protocol") + 48), objc_msgSend(*(id *)(a1 + 32), "protocol"));
  return result;
}

uint64_t __np_loopback_disconnect_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "protocol");
  if (*(_QWORD *)(result + 48))
    return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "protocol")+ 48)+ 24)+ 48))(*(_QWORD *)(objc_msgSend(*(id *)(a1 + 32), "protocol") + 48), objc_msgSend(*(id *)(a1 + 32), "protocol"));
  return result;
}

uint64_t isa_nsstring(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t isa_nsdata(void *a1)
{
  id v1;
  char isKindOfClass;

  v1 = a1;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void sub_19E90D2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

__int128 *np_direct_protocol_get_id()
{
  if (_MergedGlobals_30 != -1)
    dispatch_once(&_MergedGlobals_30, &__block_literal_global_1);
  return &xmmword_1ED0628D8;
}

void __np_direct_protocol_get_id_block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  unk_1ED0629D0 = 0u;
  unk_1ED0629C0 = 0u;
  *(_OWORD *)&qword_1ED0629B0 = 0u;
  unk_1ED0629A0 = 0u;
  unk_1ED062990 = 0u;
  unk_1ED062980 = 0u;
  unk_1ED062970 = 0u;
  *(_OWORD *)&qword_1ED062960 = 0u;
  *(_OWORD *)&qword_1ED062950 = 0u;
  unk_1ED062940 = 0u;
  unk_1ED062930 = 0u;
  unk_1ED062920 = 0u;
  unk_1ED062910 = 0u;
  xmmword_1ED0629F0 = 0u;
  unk_1ED062A00 = 0u;
  xmmword_1ED0629E0 = 0u;
  xmmword_1ED062900 = 0u;
  qword_1ED0628F8 = 0;
  xmmword_1ED0628D8 = 0u;
  unk_1ED0628E8 = 0u;
  __strlcpy_chk();
  qword_1ED0628F8 = 0x100000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(_QWORD *)&xmmword_1ED062900 = np_direct_add_input_handler;
  *((_QWORD *)&xmmword_1ED062900 + 1) = np_direct_remove_input_handler;
  qword_1ED062950 = (uint64_t)np_direct_get_input_frames;
  unk_1ED062958 = np_direct_get_output_frames;
  qword_1ED062960 = (uint64_t)np_direct_finalize_output_frames;
  qword_1ED0629B0 = (uint64_t)np_direct_supports_external_data;
  qword_1ED0629D8 = (uint64_t)np_direct_waiting_for_output;
  qword_1ED062928 = (uint64_t)np_direct_connected;
  qword_1ED062938 = (uint64_t)np_direct_error;
  if ((nw_protocol_register_extended() & 1) == 0)
  {
    nplog_obj();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v1 = 0;
      _os_log_error_impl(&dword_19E8FE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel_flow protocol", v1, 2u);
    }

  }
}

uint64_t np_direct_add_input_handler(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 40);
  *(_QWORD *)(a2 + 32) = a1;
  *(_QWORD *)(a1 + 48) = a2;
  v4 = v3;
  uuid_copy((unsigned __int8 *)objc_msgSend(v4, "protocol"), (const unsigned __int8 *)a2);

  return 1;
}

BOOL np_direct_remove_input_handler(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  uint64_t v7;
  void *v8;

  *(_QWORD *)(a2 + 32) = 0;
  v4 = a1[6];
  if (v4 == a2)
  {
    a1[6] = 0;
    v7 = a1[4];
    if (v7)
      (*(void (**)(void))(*(_QWORD *)(v7 + 24) + 8))();
    if (a3)
    {
      v8 = (void *)a1[5];
      objc_msgSend(v8, "handleDetachedFromProtocol");
      a1[5] = 0;

    }
  }
  return v4 == a2;
}

uint64_t np_direct_get_input_frames(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 80))();
}

uint64_t np_direct_get_output_frames(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(id *)(a1 + 40);
  objc_msgSend(v2, "firstTxByteTimestamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFirstTxByteTimestamp:", v4);

  }
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 88))();

  return v5;
}

uint64_t np_direct_finalize_output_frames(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 96))();
}

uint64_t np_direct_supports_external_data(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) + 176))();
}

uint64_t np_direct_waiting_for_output(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 216))();
}

void np_direct_connected(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32) == a2)
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConnectionStartDate:", v4);

    objc_msgSend(v5, "createConnectionInfo");
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) + 40))();

  }
}

uint64_t np_direct_error(uint64_t result)
{
  if (result)
  {
    result = *(_QWORD *)(result + 48);
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(result + 24) + 56))();
  }
  return result;
}

uint64_t np_direct_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NPDirectFlow *v6;
  NPDirectFlow *v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  if (_MergedGlobals_30 != -1)
    dispatch_once(&_MergedGlobals_30, &__block_literal_global_1);
  if (nw_protocols_are_equal()
    && (v6 = -[NPDirectFlow initWithParameters:]([NPDirectFlow alloc], "initWithParameters:", v5)) != 0)
  {
    v7 = v6;
    *(_QWORD *)(-[NPDirectFlow protocol](v7, "protocol") + 40) = v7;
    v8 = -[NPDirectFlow protocol](v7, "protocol");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL NSPPrivacyProxyTokenIssuerReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  NSPPrivacyProxyTokenKey *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 8;
        goto LABEL_28;
      case 2u:
        v19 = objc_alloc_init(NSPPrivacyProxyTokenKey);
        objc_msgSend(a1, "addTokenKeys:", v19);
        if (PBReaderPlaceMark() && (NSPPrivacyProxyTokenKeyReadFrom((uint64_t)v19, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_29:

LABEL_30:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 32;
        goto LABEL_28;
      case 4u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 40;
        goto LABEL_28;
      case 5u:
        PBReaderReadData();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = 24;
LABEL_28:
        v19 = *(NSPPrivacyProxyTokenKey **)&a1[v18];
        *(_QWORD *)&a1[v18] = v17;
        goto LABEL_29;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_30;
    }
  }
}

uint64_t NSPPrivacyProxyProxyInfoReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_74;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_76;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_74:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v19) = 0;
LABEL_76:
          v51 = 48;
          goto LABEL_94;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_55;
        case 3u:
          PBReaderReadData();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addProxyKeyInfo:", v26);
          goto LABEL_58;
        case 4u:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 96;
          goto LABEL_55;
        case 5u:
          v27 = 0;
          v28 = 0;
          v29 = 0;
          a1[116] |= 4u;
          while (2)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
              *(_QWORD *)(a2 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v14 = v28++ >= 9;
                if (v14)
                {
                  v29 = 0;
                  goto LABEL_80;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v29 = 0;
LABEL_80:
          v52 = v29 != 0;
          v53 = 113;
          goto LABEL_89;
        case 6u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 104;
          goto LABEL_55;
        case 7u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
          goto LABEL_55;
        case 8u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_55;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_55;
        case 0xAu:
          v33 = 0;
          v34 = 0;
          v35 = 0;
          a1[116] |= 8u;
          while (2)
          {
            v36 = *v3;
            v37 = *(_QWORD *)(a2 + v36);
            if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
              *(_QWORD *)(a2 + v36) = v37 + 1;
              v35 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v14 = v34++ >= 9;
                if (v14)
                {
                  v35 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v35 = 0;
LABEL_84:
          v52 = v35 != 0;
          v53 = 114;
          goto LABEL_89;
        case 0xBu:
          PBReaderReadString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addBootstrapAddresses:", v26);
          goto LABEL_58;
        case 0xCu:
          PBReaderReadString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addAllowedNextHops:", v26);
          goto LABEL_58;
        case 0xDu:
          PBReaderReadData();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 88;
LABEL_55:
          v39 = *(void **)&a1[v25];
          *(_QWORD *)&a1[v25] = v24;

          continue;
        case 0xEu:
          PBReaderReadString();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(a1, "addPreferredPathPatterns:", v26);
LABEL_58:

          continue;
        case 0xFu:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          a1[116] |= 2u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v14 = v41++ >= 9;
                if (v14)
                {
                  v42 = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v42 = 0;
LABEL_88:
          v52 = v42 != 0;
          v53 = 112;
LABEL_89:
          a1[v53] = v52;
          continue;
        case 0x10u:
          v46 = 0;
          v47 = 0;
          v19 = 0;
          a1[116] |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v48 = *v3;
        v49 = *(_QWORD *)(a2 + v48);
        if (v49 == -1 || v49 >= *(_QWORD *)(a2 + *v4))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v49);
        *(_QWORD *)(a2 + v48) = v49 + 1;
        v19 |= (unint64_t)(v50 & 0x7F) << v46;
        if ((v50 & 0x80) == 0)
          goto LABEL_91;
        v46 += 7;
        v14 = v47++ >= 9;
        if (v14)
        {
          LODWORD(v19) = 0;
          goto LABEL_93;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_91:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v19) = 0;
LABEL_93:
      v51 = 8;
LABEL_94:
      *(_DWORD *)&a1[v51] = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyResolverInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_23;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
LABEL_23:
          v20 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 32) |= 2u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_41;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_41:
          v32 = 28;
          goto LABEL_46;
        case 4u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_43;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_45;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_45:
      v32 = 24;
LABEL_46:
      *(_DWORD *)(a1 + v32) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyProxiedContentMapReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  void *v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  void *v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  char v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
            break;
          v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v14 = v9++ >= 9;
          if (v14)
          {
            v10 = 0;
            v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        v16 = v10 & 7;
        if (!v15 && v16 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              while (1)
              {
                v21 = *v3;
                v22 = *(_QWORD *)(a2 + v21);
                if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                  break;
                v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
                *(_QWORD *)(a2 + v21) = v22 + 1;
                v20 |= (unint64_t)(v23 & 0x7F) << v18;
                if ((v23 & 0x80) == 0)
                  goto LABEL_92;
                v18 += 7;
                v14 = v19++ >= 9;
                if (v14)
                {
                  v20 = 0;
                  goto LABEL_94;
                }
              }
              *(_BYTE *)(a2 + *v5) = 1;
LABEL_92:
              if (*(_BYTE *)(a2 + *v5))
                v20 = 0;
LABEL_94:
              v69 = v20 != 0;
              v70 = 80;
              goto LABEL_120;
            case 2u:
              PBReaderReadString();
              v50 = objc_claimAutoreleasedReturnValue();
              v51 = *(void **)(a1 + 40);
              *(_QWORD *)(a1 + 40) = v50;

              goto LABEL_121;
            case 3u:
              if (v16 == 2)
              {
                result = PBReaderPlaceMark();
                if (!(_DWORD)result)
                  return result;
                while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
                {
                  v25 = 0;
                  v26 = 0;
                  v27 = 0;
                  while (1)
                  {
                    v28 = *v3;
                    v29 = *(_QWORD *)(a2 + v28);
                    if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                      break;
                    v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
                    *(_QWORD *)(a2 + v28) = v29 + 1;
                    v27 |= (unint64_t)(v30 & 0x7F) << v25;
                    if (v30 < 0)
                    {
                      v25 += 7;
                      v14 = v26++ >= 9;
                      if (!v14)
                        continue;
                    }
                    goto LABEL_38;
                  }
                  *(_BYTE *)(a2 + *v5) = 1;
LABEL_38:
                  PBRepeatedUInt32Add();
                }
                PBReaderRecallMark();
              }
              else
              {
                v72 = 0;
                v73 = 0;
                v74 = 0;
                while (1)
                {
                  v75 = *v3;
                  v76 = *(_QWORD *)(a2 + v75);
                  if (v76 == -1 || v76 >= *(_QWORD *)(a2 + *v4))
                    break;
                  v77 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
                  *(_QWORD *)(a2 + v75) = v76 + 1;
                  v74 |= (unint64_t)(v77 & 0x7F) << v72;
                  if (v77 < 0)
                  {
                    v72 += 7;
                    v14 = v73++ >= 9;
                    if (!v14)
                      continue;
                  }
                  goto LABEL_132;
                }
                *(_BYTE *)(a2 + *v5) = 1;
LABEL_132:
                PBRepeatedUInt32Add();
              }
LABEL_121:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
            case 4u:
              PBReaderReadString();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend((id)a1, "addHostnames:", v31);
              goto LABEL_83;
            case 5u:
              PBReaderReadString();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend((id)a1, "addProcesses:", v31);
              goto LABEL_83;
            case 6u:
              v52 = 0;
              v53 = 0;
              v54 = 0;
              *(_BYTE *)(a1 + 88) |= 0x20u;
              while (2)
              {
                v55 = *v3;
                v56 = *(_QWORD *)(a2 + v55);
                if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
                  *(_QWORD *)(a2 + v55) = v56 + 1;
                  v54 |= (unint64_t)(v57 & 0x7F) << v52;
                  if (v57 < 0)
                  {
                    v52 += 7;
                    v14 = v53++ >= 9;
                    if (v14)
                    {
                      v54 = 0;
                      goto LABEL_110;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v54 = 0;
LABEL_110:
              v69 = v54 != 0;
              v70 = 84;
              goto LABEL_120;
            case 7u:
              v58 = 0;
              v59 = 0;
              v40 = 0;
              *(_BYTE *)(a1 + 88) |= 1u;
              while (2)
              {
                v60 = *v3;
                v61 = *(_QWORD *)(a2 + v60);
                if (v61 == -1 || v61 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v61);
                  *(_QWORD *)(a2 + v60) = v61 + 1;
                  v40 |= (unint64_t)(v62 & 0x7F) << v58;
                  if (v62 < 0)
                  {
                    v58 += 7;
                    v14 = v59++ >= 9;
                    if (v14)
                    {
                      LODWORD(v40) = 0;
                      goto LABEL_114;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v40) = 0;
LABEL_114:
              v71 = 48;
              goto LABEL_115;
            case 8u:
              v32 = 0;
              v33 = 0;
              v34 = 0;
              *(_BYTE *)(a1 + 88) |= 0x10u;
              while (2)
              {
                v35 = *v3;
                v36 = *(_QWORD *)(a2 + v35);
                if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
                  *(_QWORD *)(a2 + v35) = v36 + 1;
                  v34 |= (unint64_t)(v37 & 0x7F) << v32;
                  if (v37 < 0)
                  {
                    v32 += 7;
                    v14 = v33++ >= 9;
                    if (v14)
                    {
                      v34 = 0;
                      goto LABEL_98;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v34 = 0;
LABEL_98:
              v69 = v34 != 0;
              v70 = 83;
              goto LABEL_120;
            case 9u:
              PBReaderReadString();
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
                objc_msgSend((id)a1, "addUrls:", v31);
LABEL_83:

              goto LABEL_121;
            case 0xAu:
              v38 = 0;
              v39 = 0;
              v40 = 0;
              *(_BYTE *)(a1 + 88) |= 2u;
              while (2)
              {
                v41 = *v3;
                v42 = *(_QWORD *)(a2 + v41);
                if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
                  *(_QWORD *)(a2 + v41) = v42 + 1;
                  v40 |= (unint64_t)(v43 & 0x7F) << v38;
                  if (v43 < 0)
                  {
                    v38 += 7;
                    v14 = v39++ >= 9;
                    if (v14)
                    {
                      LODWORD(v40) = 0;
                      goto LABEL_102;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                LODWORD(v40) = 0;
LABEL_102:
              v71 = 64;
LABEL_115:
              *(_DWORD *)(a1 + v71) = v40;
              goto LABEL_121;
            case 0xBu:
              v63 = 0;
              v64 = 0;
              v65 = 0;
              *(_BYTE *)(a1 + 88) |= 8u;
              while (2)
              {
                v66 = *v3;
                v67 = *(_QWORD *)(a2 + v66);
                if (v67 == -1 || v67 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v68 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v67);
                  *(_QWORD *)(a2 + v66) = v67 + 1;
                  v65 |= (unint64_t)(v68 & 0x7F) << v63;
                  if (v68 < 0)
                  {
                    v63 += 7;
                    v14 = v64++ >= 9;
                    if (v14)
                    {
                      v65 = 0;
                      goto LABEL_119;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v65 = 0;
LABEL_119:
              v69 = v65 != 0;
              v70 = 82;
              goto LABEL_120;
            case 0xCu:
              v44 = 0;
              v45 = 0;
              v46 = 0;
              *(_BYTE *)(a1 + 88) |= 4u;
              while (2)
              {
                v47 = *v3;
                v48 = *(_QWORD *)(a2 + v47);
                if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
                {
                  *(_BYTE *)(a2 + *v5) = 1;
                }
                else
                {
                  v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
                  *(_QWORD *)(a2 + v47) = v48 + 1;
                  v46 |= (unint64_t)(v49 & 0x7F) << v44;
                  if (v49 < 0)
                  {
                    v44 += 7;
                    v14 = v45++ >= 9;
                    if (v14)
                    {
                      v46 = 0;
                      goto LABEL_106;
                    }
                    continue;
                  }
                }
                break;
              }
              if (*(_BYTE *)(a2 + *v5))
                v46 = 0;
LABEL_106:
              v69 = v46 != 0;
              v70 = 81;
LABEL_120:
              *(_BYTE *)(a1 + v70) = v69;
              goto LABEL_121;
            default:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                goto LABEL_121;
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTokenKeyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_41:
        v32 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadData();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_45:
        v32 = 8;
      }
      *(_QWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTokenActivationQueryReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  NSPPrivacyProxyBAAValidation *v24;
  uint64_t v25;
  void *v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_36;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_38:
        *(_DWORD *)(a1 + 16) = v19;
        goto LABEL_39;
      case 2u:
        v24 = objc_alloc_init(NSPPrivacyProxyBAAValidation);
        objc_storeStrong((id *)(a1 + 24), v24);
        if (!PBReaderPlaceMark() || !NSPPrivacyProxyBAAValidationReadFrom((uint64_t)v24, a2))
          goto LABEL_41;
        goto LABEL_33;
      case 3u:
        v24 = objc_alloc_init(NSPPrivacyProxyTokenInfo);
        objc_storeStrong((id *)(a1 + 32), v24);
        if (PBReaderPlaceMark() && NSPPrivacyProxyTokenInfoReadFrom((char *)v24, a2))
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_39:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_41:

        return 0;
      case 4u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v25;

        goto LABEL_39;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_39;
    }
  }
}

void enable_timestamps(char a1)
{
  _QWORD block[4];
  char v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __enable_timestamps_block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v2 = a1;
  if (enable_timestamps_onceToken != -1)
    dispatch_once(&enable_timestamps_onceToken, block);
}

void __enable_timestamps_block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_BYTE *)(a1 + 32))
  {
    if (mach_timebase_info((mach_timebase_info_t)&g_timebaseInfo))
    {
      nplog_obj();
      v1 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v2 = 0;
        _os_log_error_impl(&dword_19E8FE000, v1, OS_LOG_TYPE_ERROR, "Failed to get the timebase info", v2, 2u);
      }

    }
    else
    {
      g_recordTimestamps = 1;
    }
  }
}

double get_interval_for_mach_times(unint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  double result;

  result = 0.0;
  if (a2 > a1)
  {
    if (g_recordTimestamps)
    {
      LODWORD(a4) = g_timebaseInfo;
      LODWORD(a5) = unk_1EE52E120;
      return (double)(a2 - a1) * (double)*(unint64_t *)&a4 / (double)*(unint64_t *)&a5 / 1000000.0;
    }
  }
  return result;
}

_QWORD *create_timestamps()
{
  _QWORD *result;

  if (!g_recordTimestamps)
    return 0;
  result = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
  if (result)
  {
    result[14] = 0;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)result = 0u;
  }
  return result;
}

id get_nsdata_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  xpc_dictionary_get_value(a1, a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && MEMORY[0x1A1AEADA0](v2) == MEMORY[0x1E0C812E8])
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return v4;
}

id get_nsdictionary_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  xpc_dictionary_get_value(a1, a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && MEMORY[0x1A1AEADA0](v2) == MEMORY[0x1E0C812F8])
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return v4;
}

id get_nsarray_from_xpc_object(void *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void *v4;

  xpc_dictionary_get_value(a1, a2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2 && MEMORY[0x1A1AEADA0](v2) == MEMORY[0x1E0C812C8])
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v4 = 0;

  return v4;
}

uint64_t NSPPrivacyProxyAuthenticationInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  NSPPrivacyProxyTokenAttester *v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    v16 = v10 & 7;
    if (v15 || v16 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 80) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_53;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_55;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_53:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_55:
        *(_DWORD *)(a1 + 56) = v20;
        goto LABEL_66;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 64;
        goto LABEL_30;
      case 3u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 48;
LABEL_30:
        v26 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_66;
      case 4u:
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v28 = 0;
            v29 = 0;
            v30 = 0;
            while (1)
            {
              v31 = *v3;
              v32 = *(_QWORD *)(a2 + v31);
              if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
                break;
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v14 = v29++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_43;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
          while (1)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
              break;
            v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 1;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              v14 = v36++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_65;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_65:
          PBRepeatedUInt32Add();
        }
        goto LABEL_66;
      case 5u:
        PBReaderReadString();
        v34 = (NSPPrivacyProxyTokenAttester *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend((id)a1, "addAccessTokenKnownOrigins:", v34);
        goto LABEL_51;
      case 6u:
        PBReaderReadString();
        v34 = (NSPPrivacyProxyTokenAttester *)objc_claimAutoreleasedReturnValue();
        if (v34)
          objc_msgSend((id)a1, "addAccessTokenBlockedIssuers:", v34);
        goto LABEL_51;
      case 7u:
        v34 = objc_alloc_init(NSPPrivacyProxyTokenAttester);
        objc_msgSend((id)a1, "addNonDefaultAttesters:", v34);
        if (PBReaderPlaceMark() && (NSPPrivacyProxyTokenAttesterReadFrom((uint64_t)v34, a2) & 1) != 0)
        {
          PBReaderRecallMark();
LABEL_51:

LABEL_66:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_66;
    }
  }
}

double NPFrameStream::NPFrameStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  double result;

  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a4;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = a3;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a1 + 84) & 0xC0 | 1;
  *(_QWORD *)(a3 + 24) = a1 + 16;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = &off_1E4136CC8;
  result = 0.0;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_BYTE *)(a1 + 84) &= ~2u;
  *(_QWORD *)(a1 + 240) = a1 + 85;
  *(_QWORD *)(a1 + 248) = 20;
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)a1 = off_1E4136588;
  *(_QWORD *)(a1 + 16) = &unk_1E4136628;
  *(_QWORD *)(a1 + 24) = &unk_1E4136650;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_DWORD *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  return result;
}

uint64_t NPFrameStream::flush(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  size_t v8;
  NSObject *v9;
  dispatch_data_t v10;
  _QWORD destructor[5];

  v2 = a1 + 7;
  v3 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)(a1 + 7), a1[7]);
  if (v3)
  {
    v4 = v3;
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      (*(void (**)(uint64_t *))(*a1 + 136))(a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(const void **)(v4 + 24);
      v8 = *(_QWORD *)(v4 + 32);
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      destructor[0] = v5;
      destructor[1] = 3221225472;
      destructor[2] = ___ZN13NPFrameStream5flushER3AIO_block_invoke;
      destructor[3] = &__block_descriptor_40_e5_v8__0l;
      destructor[4] = v4;
      v10 = dispatch_data_create(v7, v8, v9, destructor);

      objc_msgSend(v6, "write:", v10);
      v4 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v2, *v2);
    }
    while (v4);
  }
  return 0;
}

void sub_19E91DB14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZN13NPFrameStream5flushER3AIO_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 24))(*(_QWORD *)(a1 + 32));
}

uint64_t NPFrameStream::dispose(NPFrameStream *this, const char *a2, int a3)
{
  uint64_t v6;

  v6 = *((_QWORD *)this + 34);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 24))(v6);
    *((_QWORD *)this + 34) = 0;
  }
  return FrameStream::dispose(this, a2, a3);
}

uint64_t FrameStream::dispose(FrameStream *this, const char *a2, int a3)
{
  uint64_t result;

  PendingStream::dispose(this, a2, a3);
  *((_BYTE *)this + 84) &= ~2u;
  result = *((_QWORD *)this + 26);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
    *((_QWORD *)this + 26) = 0;
  }
  *((_QWORD *)this + 30) = (char *)this + 85;
  *((_QWORD *)this + 31) = 20;
  return result;
}

dispatch_data_t NPFrameStream::initialData(NPFrameStream *this, int a2)
{
  uint64_t v2;
  uint64_t *v3;
  dispatch_data_t v5;

  v3 = (uint64_t *)((char *)this + 56);
  v2 = *((_QWORD *)this + 7);
  if (v2)
  {
    v5 = dispatch_data_create(*(const void **)(v2 + 24), *(_QWORD *)(v2 + 32), 0, 0);
    if (a2)
    {
      LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v3, *v3);
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void sub_19E91DC48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t NPFrameStream::takeCurrentPacket(NPFrameStream *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 34);
  *((_QWORD *)this + 34) = 0;
  return v1;
}

uint64_t NPFrameStream::amountToBeRead(NPFrameStream *this)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *((_QWORD *)this + 34);
  if (v2)
  {
    v3 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2) + 16);
    v4 = (_QWORD *)(*((_QWORD *)this + 34) + 32);
  }
  else
  {
    v4 = (_QWORD *)((char *)this + 304);
    v3 = 20;
  }
  return v3 - *v4;
}

uint64_t NPFrameStream::handleReadData(NPFrameStream *this, nw_frame_array_s *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  nw_frame_array_foreach();
  v2 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

void sub_19E91DD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL ___ZN13NPFrameStream14handleReadDataEP16nw_frame_array_s_block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v3;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  nw_frame_unclaimed_bytes();
  v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;

  return v3;
}

void sub_19E91E2E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void NPFrameStream::logCurrentState(NPFrameStream *this, int a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = *((_QWORD *)this + 39);
      v7 = *((_QWORD *)this + 40);
      v9 = *((_QWORD *)this + 42);
      v8 = *((_QWORD *)this + 43);
      v10 = *((_QWORD *)this + 41);
      v16 = 134219008;
      v17 = v6;
      v18 = 2048;
      v19 = v7;
      v20 = 2048;
      v21 = v10;
      v22 = 2048;
      v23 = v8;
      v24 = 2048;
      v25 = v9;
      _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "[bytes = %lu, frames = %lu, last frame = %lu, partial frames = %lu, partial headers = %lu]", (uint8_t *)&v16, 0x34u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v11 = *((_QWORD *)this + 39);
    v12 = *((_QWORD *)this + 40);
    v14 = *((_QWORD *)this + 42);
    v13 = *((_QWORD *)this + 43);
    v15 = *((_QWORD *)this + 41);
    v16 = 134219008;
    v17 = v11;
    v18 = 2048;
    v19 = v12;
    v20 = 2048;
    v21 = v15;
    v22 = 2048;
    v23 = v13;
    v24 = 2048;
    v25 = v14;
    _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "[bytes = %lu, frames = %lu, last frame = %lu, partial frames = %lu, partial headers = %lu]", (uint8_t *)&v16, 0x34u);
  }

}

uint64_t NPFrameStream::handleConnectionConnected(NPFrameStream *this)
{
  int v2;

  v2 = 0;
  return (*(uint64_t (**)(NPFrameStream *, int *))(*(_QWORD *)this + 64))(this, &v2);
}

uint64_t PendingStream::fd(PendingStream *this)
{
  return *(unsigned int *)(*((_QWORD *)this + 6) + 16);
}

uint64_t FrameStream::dispatch()
{
  uint64_t result;
  uint64_t v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t (***v6)(_QWORD, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Socket *v11;
  int v12;
  char *v13;
  uint64_t (*v14)(uint64_t, const char *, _QWORD);
  const char *v15;
  uint64_t (*v16)(uint64_t, const char *, _QWORD);
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  int v22[8192];
  uint64_t v23;

  result = MEMORY[0x1E0C80A78]();
  v3 = result;
  v23 = *MEMORY[0x1E0C80C00];
  if ((v2 & 1) != 0)
  {
    v11 = *(Socket **)(result + 48);
    v21 = 4;
    v22[0] = 0;
    if (Socket::get(v11, 0xFFFF, 4103, v22, &v21))
      v12 = v22[0];
    else
      v12 = 0;
    v13 = strerror(v12);
    return (*(uint64_t (**)(uint64_t, char *, _QWORD))(*(_QWORD *)v3 + 80))(v3, v13, ((v12 - 60) < 6) & (0x23u >> (v12 - 60)));
  }
  v4 = v2;
  v5 = v1;
  if ((v2 & 4) == 0)
    goto LABEL_17;
  if ((*(_BYTE *)(result + 84) & 4) != 0)
  {
    result = (***(uint64_t (****)(_QWORD, int *, uint64_t))(result + 48))(*(_QWORD *)(result + 48), v22, 0x8000);
    if (result >= 1)
      goto LABEL_17;
    v14 = *(uint64_t (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v3 + 80);
    v15 = "tarpit escapee";
    return v14(v3, v15, 0);
  }
  v6 = *(uint64_t (****)(_QWORD, uint64_t, uint64_t))(result + 48);
  v7 = *(_QWORD *)(v3 + 240);
  v8 = *(_QWORD *)(v3 + 248);
  while (1)
  {
    v9 = (**v6)(v6, v7, v8);
    if (!v9)
    {
      v16 = *(uint64_t (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v3 + 80);
      v17 = "peer closed";
      return v16(v3, v17, 0);
    }
    if (v9 < 0)
    {
      result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v3 + 48) + 72))(*(_QWORD *)(v3 + 48));
      if ((result & 1) != 0)
        goto LABEL_17;
      v18 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v3 + 48) + 80))(*(_QWORD *)(v3 + 48), 0);
      v16 = *(uint64_t (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v3 + 80);
      v17 = (const char *)v18;
      return v16(v3, v17, 0);
    }
    v10 = *(_QWORD *)(v3 + 248);
    v7 = *(_QWORD *)(v3 + 240) + v9;
    v8 = v10 - v9;
    *(_QWORD *)(v3 + 240) = v7;
    *(_QWORD *)(v3 + 248) = v10 - v9;
    if (v10 != v9)
      goto LABEL_11;
    if ((*(_BYTE *)(v3 + 84) & 2) != 0)
      break;
    result = FrameStream::header((FrameStream *)v3);
    if (!(_DWORD)result)
      return result;
    v7 = *(_QWORD *)(v3 + 240);
    v8 = *(_QWORD *)(v3 + 248);
LABEL_11:
    v6 = *(uint64_t (****)(_QWORD, uint64_t, uint64_t))(v3 + 48);
  }
  v19 = *(_QWORD *)(v3 + 208);
  if (v19)
    v20 = v19 + 112;
  else
    v20 = v3 + 85;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 96))(v3, v20);
  if (*(_DWORD *)(*(_QWORD *)(v3 + 48) + 16) != -1)
  {
    *(_BYTE *)(v3 + 84) &= ~2u;
    result = *(_QWORD *)(v3 + 208);
    if (result)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 24))(result);
      *(_QWORD *)(v3 + 208) = 0;
    }
    *(_QWORD *)(v3 + 240) = v3 + 85;
    *(_QWORD *)(v3 + 248) = 20;
LABEL_17:
    if ((v4 & 2) == 0)
    {
      if ((v4 & 8) != 0)
      {
        result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 64))(v3, v5);
        if (!(_DWORD)result)
        {
          if ((*(_BYTE *)(v3 + 84) & 8) != 0)
            return shutdown(*(_DWORD *)(*(_QWORD *)(v3 + 48) + 16), 1);
          else
            return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 40))(v3, v5);
        }
      }
      return result;
    }
    v14 = *(uint64_t (**)(uint64_t, const char *, _QWORD))(*(_QWORD *)v3 + 80);
    v15 = "hangup";
    return v14(v3, v15, 0);
  }
  return result;
}

int *PendingStream::blocked(uint64_t a1)
{
  int *result;

  result = *(int **)(a1 + 32);
  if (result[2] <= 0)
    return (int *)Log::trace((Log *)result, "[%d] blocked", *(_DWORD *)(a1 + 80));
  return result;
}

int *PendingStream::writable(uint64_t a1)
{
  int *result;

  result = *(int **)(a1 + 32);
  if (result[2] <= 0)
    return (int *)Log::trace((Log *)result, "[%d] writable", *(_DWORD *)(a1 + 80));
  return result;
}

int *PendingStream::emit(Log **this, const char *a2, const char *a3)
{
  int *result;

  result = __error();
  if (*result != 36)
    return (int *)Log::error(this[4], "[%d] %s (%s)", *((_DWORD *)this + 20), a2, a3);
  return result;
}

uint64_t PendingStream::readable(uint64_t a1, int *a2, int a3)
{
  int *v6;
  const char *v7;
  int v8;
  unsigned int v9;
  uint16_t v10;

  v6 = *(int **)(a1 + 32);
  if (v6[2] <= 1)
  {
    v7 = "no";
    if (a3)
      v7 = "yes";
    Log::info((Log *)v6, "[%d] readable (%s)", *(_DWORD *)(a1 + 80), v7);
  }
  v8 = *(_DWORD *)(a1 + 8);
  if (!a3)
  {
    if ((v8 & 4) != 0)
    {
      v9 = v8 & 0xFFFFFFFB;
      v10 = 8;
      goto LABEL_11;
    }
    return 1;
  }
  if ((v8 & 4) != 0)
    return 1;
  v9 = v8 | 4;
  v10 = 5;
LABEL_11:
  *(_DWORD *)(a1 + 8) = v9;
  return AIO::rw(a2, (void *)a1, 4, v10);
}

uint64_t PendingStream::reclaim(PendingStream *this)
{
  (*(void (**)(PendingStream *, const char *, uint64_t))(*(_QWORD *)this + 80))(this, "out of buffers", 1);
  return 0;
}

uint64_t PendingStream::dubious(PendingStream *this, const char *a2)
{
  return (*(uint64_t (**)(PendingStream *, const char *, _QWORD))(*(_QWORD *)this + 80))(this, a2, 0);
}

char *FrameStream::advise(FrameStream *this, int a2, unsigned int a3)
{
  char v3;
  int *v6;
  const char *v7;
  char *result;

  v3 = a3;
  v6 = (int *)*((_QWORD *)this + 4);
  if (v6[2] <= 1)
  {
    if (a3 > 5)
      v7 = "<unknown>";
    else
      v7 = (&Frame::Exception::label(int)::names)[a3];
    Log::info((Log *)v6, "[%d] exception '%s' on channel %d", *((_DWORD *)this + 20), v7, a2);
  }
  result = (char *)malloc_type_malloc(0x8DuLL, 0x500D4304uLL);
  if (result)
  {
    *(_OWORD *)(result + 24) = 0u;
    *((_QWORD *)result + 5) = 0;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = &unk_1E4136A88;
    *((_QWORD *)result + 3) = result + 112;
    *((_QWORD *)result + 4) = 25;
    result[136] = v3;
    *((_DWORD *)result + 32) = 168099865;
    *((_DWORD *)result + 33) = a2;
    return (char *)(*(uint64_t (**)(char *, char *, char *))(*((_QWORD *)this + 3) + 48))((char *)this + 24, result, (char *)this + 24);
  }
  return result;
}

uint64_t FrameStream::acknowledge(FrameStream *this, int a2, int a3, int a4)
{
  NSObject *v7;
  char *v8;
  int v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a4 && *(int *)(*((_QWORD *)this + 4) + 8) <= 1)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = *((_DWORD *)this + 20);
      v11[0] = 67109632;
      v11[1] = v10;
      v12 = 1024;
      v13 = a3;
      v14 = 1024;
      v15 = a2;
      _os_log_debug_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEBUG, "[%d] sending ack(%d) on channel %d", (uint8_t *)v11, 0x14u);
    }

  }
  v8 = (char *)malloc_type_malloc(0x90uLL, 0x500D4304uLL);
  if (!v8)
    return 0;
  *(_OWORD *)(v8 + 24) = 0u;
  *((_QWORD *)v8 + 5) = 0;
  *(_OWORD *)(v8 + 8) = 0u;
  *(_QWORD *)v8 = &unk_1E4136A88;
  *((_QWORD *)v8 + 3) = v8 + 112;
  *((_QWORD *)v8 + 4) = 28;
  *((_DWORD *)v8 + 33) = a2;
  *((_DWORD *)v8 + 34) = a3;
  *((_DWORD *)v8 + 32) = 167772188;
  return (*(uint64_t (**)(char *))(*((_QWORD *)this + 3) + 48))((char *)this + 24);
}

char *FrameStream::helloack(FrameStream *this, int a2)
{
  int *v4;
  char *result;

  v4 = (int *)*((_QWORD *)this + 4);
  if (v4[2] <= 0)
    Log::trace((Log *)v4, "[%d] sending hack (time %d)", *((_DWORD *)this + 20), a2);
  result = (char *)malloc_type_malloc(0x8CuLL, 0x500D4304uLL);
  if (result)
  {
    *(_OWORD *)(result + 24) = 0u;
    *((_QWORD *)result + 5) = 0;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = &unk_1E4136A88;
    *((_QWORD *)result + 3) = result + 112;
    *((_QWORD *)result + 4) = 24;
    *((_DWORD *)result + 32) = 167968792;
    *((_DWORD *)result + 33) = a2;
    return (char *)(*(uint64_t (**)(char *, char *, char *))(*((_QWORD *)this + 3) + 48))((char *)this + 24, result, (char *)this + 24);
  }
  return result;
}

int *`non-virtual thunk to'PendingStream::emit(Log **this, const char *a2, const char *a3)
{
  return PendingStream::emit(this - 2, a2, a3);
}

uint64_t Transfer::address(Transfer *this)
{
  return 0;
}

uint64_t Transfer::session(Transfer *this, char *a2)
{
  return 0;
}

uint64_t `non-virtual thunk to'FrameStream::eof(FrameStream *this, int a2)
{
  return FrameStream::done((FrameStream *)((char *)this - 24), a2);
}

uint64_t `non-virtual thunk to'PendingStream::readable(uint64_t a1, int *a2, int a3)
{
  return PendingStream::readable(a1 - 24, a2, a3);
}

uint64_t Transfer::attach(Transfer *this, Transfer *a2)
{
  return 0;
}

uint64_t Transfer::receipt(Transfer *this)
{
  return 0;
}

uint64_t Transfer::transmit()
{
  return 0;
}

char *`non-virtual thunk to'FrameStream::advise(FrameStream *this, int a2, unsigned int a3)
{
  return FrameStream::advise((FrameStream *)((char *)this - 24), a2, a3);
}

uint64_t PendingStream::dispose(PendingStream *this, const char *a2, int a3)
{
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *((_DWORD *)this + 20);
      v7 = *((_DWORD *)this + 18);
      v17 = 67109634;
      v18 = v6;
      v19 = 2080;
      v20 = a2;
      v21 = 1024;
      v22 = v7;
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
LABEL_7:
      _os_log_impl(&dword_19E8FE000, v8, v9, "[%d] dispose ('%s') :: queue=%u", (uint8_t *)&v17, 0x18u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (*((_DWORD *)this + 18))
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = *((_DWORD *)this + 20);
      v11 = *((_DWORD *)this + 18);
      v17 = 67109634;
      v18 = v10;
      v19 = 2080;
      v20 = a2;
      v21 = 1024;
      v22 = v11;
      v8 = v5;
      v9 = OS_LOG_TYPE_INFO;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (*(int *)(*((_QWORD *)this + 4) + 8) <= 0)
  {
    nplog_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v16 = *((_DWORD *)this + 20);
      v17 = 67109378;
      v18 = v16;
      v19 = 2080;
      v20 = a2;
      _os_log_debug_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEBUG, "[%d] dispose ('%s')", (uint8_t *)&v17, 0x12u);
    }
    goto LABEL_8;
  }
LABEL_9:
  v13 = (uint64_t *)((char *)this + 56);
  v12 = *((_QWORD *)this + 7);
  if (v12)
  {
    do
    {
      v14 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)this + 56, v12);
      (*(void (**)(uint64_t))(*(_QWORD *)v14 + 24))(v14);
      v12 = *v13;
    }
    while (*v13);
  }
  *((_BYTE *)this + 84) = *((_BYTE *)this + 84) & 0xC2 | 1;
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 6) + 24))(*((_QWORD *)this + 6));
}

size_t Pending::write(Pending *this, const void *a2, size_t a3)
{
  memmove((void *)(*((_QWORD *)this + 3) + *((_QWORD *)this + 4)), a2, a3);
  *((_QWORD *)this + 4) += a3;
  return a3;
}

void Pending::~Pending(Pending *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Pending::header(Pending *this)
{
  return 0;
}

uint64_t Pending::label(Pending *this)
{
  uint64_t v1;

  v1 = (*(uint64_t (**)(Pending *))(*(_QWORD *)this + 32))(this);
  return ((uint64_t (*)(void))Frame::Prefix::meta(void)::meta[5 * *(unsigned __int8 *)(v1 + 18) + 1])();
}

uint64_t Frame::Ack::size(Frame::Ack *this)
{
  return 28;
}

const char *Frame::Ack::string(Frame::Ack *this)
{
  return "ack";
}

BOOL Frame::Ack::validate(Frame::Ack *this)
{
  return (_DWORD)this == 28;
}

uint64_t Frame::Prefix::Meta::fencrypt(uint64_t a1, uint64_t (***a2)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))
{
  return (**a2)(a2, a1 - 64, 4, *(unsigned __int16 *)(a1 + 16) - 20, 0);
}

uint64_t Frame::Prefix::Meta::fdecrypt(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 8))(a2, a1 - 64, 4, *(unsigned __int16 *)(a1 + 16) - 20, 0);
}

uint64_t Frame::Data::size(Frame::Data *this)
{
  return 24;
}

const char *Frame::Data::string(Frame::Data *this)
{
  return "data";
}

BOOL Frame::Data::validate(Frame::Data *this)
{
  return ((_DWORD)this - 24) < 0x4E9;
}

uint64_t Frame::Hello::size(Frame::Hello *this)
{
  return 88;
}

const char *Frame::Hello::string(Frame::Hello *this)
{
  return "hello";
}

BOOL Frame::Hello::validate(Frame::Hello *this)
{
  return (_DWORD)this == 88;
}

uint64_t Frame::Prefix::Meta::hencrypt(uint64_t a1, uint64_t (***a2)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD))
{
  return (**a2)(a2, a1 - 64, 72, 0, 0);
}

uint64_t Frame::Prefix::Meta::hdecrypt(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 8))(a2, a1 - 64, 72, 0, 0);
}

uint64_t Frame::Hack::size(Frame::Hack *this)
{
  return 24;
}

const char *Frame::Hack::string(Frame::Hack *this)
{
  return "hack";
}

BOOL Frame::Hack::validate(Frame::Hack *this)
{
  return (_DWORD)this == 24;
}

uint64_t Frame::Request::size(Frame::Request *this)
{
  return 57;
}

const char *Frame::Request::string(Frame::Request *this)
{
  return "request";
}

BOOL Frame::Request::validate(Frame::Request *this)
{
  return ((_DWORD)this - 57) < 0x4C8;
}

uint64_t Frame::Exception::size(Frame::Exception *this)
{
  return 25;
}

const char *Frame::Exception::string(Frame::Exception *this)
{
  return "exception";
}

BOOL Frame::Exception::validate(Frame::Exception *this)
{
  return (_DWORD)this == 25;
}

uint64_t Frame::Rekey::size(Frame::Rekey *this)
{
  return 116;
}

const char *Frame::Rekey::string(Frame::Rekey *this)
{
  return "rekey";
}

BOOL Frame::Rekey::validate(Frame::Rekey *this)
{
  return (_DWORD)this == 116;
}

uint64_t Frame::Capacity::size(Frame::Capacity *this)
{
  return 20;
}

const char *Frame::Capacity::string(Frame::Capacity *this)
{
  return "capacity";
}

BOOL Frame::Capacity::validate(Frame::Capacity *this)
{
  return ((_DWORD)this - 20) < 0x4ED;
}

uint64_t Frame::Advertise::size(Frame::Advertise *this)
{
  return 24;
}

const char *Frame::Advertise::string(Frame::Advertise *this)
{
  return "advertise";
}

BOOL Frame::Advertise::validate(Frame::Advertise *this)
{
  return ((_DWORD)this - 24) < 0x4E9;
}

uint64_t Frame::Ping::size(Frame::Ping *this)
{
  return 44;
}

const char *Frame::Ping::string(Frame::Ping *this)
{
  return "ping";
}

BOOL Frame::Ping::validate(Frame::Ping *this)
{
  return (this & 0xFFFFFFFB) == 40;
}

uint64_t Log::trace(Log *this, const char *a2, ...)
{
  va_list v4;
  va_list va;

  va_start(va, a2);
  if (*((int *)this + 2) <= 0)
  {
    va_copy(v4, va);
    (*(void (**)(_QWORD, Log *, const char *, const char *, va_list *))(**((_QWORD **)this + 3) + 16))(*((_QWORD *)this + 3), this, "trace", a2, &v4);
    ++*((_DWORD *)this + 10);
  }
  return 0;
}

uint64_t AIO::rw(int *a1, void *a2, char a3, uint16_t a4)
{
  int v8;
  int v9;
  kevent *v10;
  int v11;
  int *v12;
  char *v13;
  kevent changelist[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 16))(a2);
  if (v8 == -1)
    return 0;
  if ((a3 & 4) != 0)
  {
    changelist[0].ident = v8;
    changelist[0].filter = -1;
    changelist[0].flags = a4;
    changelist[0].fflags = 0;
    v9 = 1;
    changelist[0].data = 0;
    changelist[0].udata = a2;
    if ((a3 & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  v9 = 0;
  if ((a3 & 8) != 0)
  {
LABEL_6:
    v10 = &changelist[v9];
    v10->ident = v8;
    v10->filter = -2;
    v10->flags = a4;
    v10->fflags = 0;
    v10->data = 0;
    v10->udata = a2;
    ++v9;
  }
LABEL_7:
  if (kevent(*a1, changelist, v9, 0, 0, 0))
  {
    v11 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 16))(a2);
    v12 = __error();
    v13 = strerror(*v12);
    printf("<<<<<<<<< kevent setup failed (%d: %s) >>>>>>>>>>\n", v11, v13);
    return 0;
  }
  return 1;
}

void Buffer::~Buffer(Buffer *this)
{
  *(_QWORD *)this = &unk_1E4136A88;
}

{
  *(_QWORD *)this = &unk_1E4136A88;
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Buffer::header(Buffer *this)
{
  return (uint64_t)this + 112;
}

uint64_t FrameStream::header(FrameStream *this)
{
  Frame::Ack *v2;
  uint64_t result;
  __int128 v4;
  int *v5;
  int v6;
  const char *v7;
  _DWORD *v8;
  uint64_t v9;

  if (*((unsigned __int8 *)this + 103) > 9uLL
    || (v2 = (Frame::Ack *)*(unsigned __int16 *)((char *)this + 101),
        (Frame::Prefix::meta(void)::meta[5 * *((unsigned __int8 *)this + 103) + 2](v2) & 1) == 0))
  {
    (*(void (**)(FrameStream *, const char *))(*(_QWORD *)this + 88))(this, "invalid header");
    return 0;
  }
  result = (uint64_t)malloc_type_malloc((size_t)v2 + 116, 0x500D4304uLL);
  if (!result)
  {
    *((_QWORD *)this + 26) = 0;
    return result;
  }
  *(_QWORD *)(result + 40) = 0;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 8) = 0u;
  *(_QWORD *)result = &unk_1E4136A88;
  *((_QWORD *)this + 26) = result;
  *((_QWORD *)this + 30) = result + 132;
  v4 = *(_OWORD *)((char *)this + 85);
  *(_DWORD *)(result + 128) = *(_DWORD *)((char *)this + 101);
  *(_OWORD *)(result + 112) = v4;
  v5 = (int *)*((_QWORD *)this + 4);
  if (v5[2] <= 0)
  {
    v6 = *((_DWORD *)this + 20);
    v7 = (const char *)((uint64_t (*)(void))Frame::Prefix::meta(void)::meta[5 * *((unsigned __int8 *)this + 103) + 1])();
    Log::trace((Log *)v5, "[%d] incoming <%s:%d>", v6, v7, (_DWORD)v2);
  }
  *((_QWORD *)this + 31) = (char *)v2 - 20;
  if (v2 != (Frame::Ack *)20)
  {
    *((_BYTE *)this + 84) |= 2u;
    return 1;
  }
  (*(void (**)(FrameStream *, char *))(*(_QWORD *)this + 96))(this, (char *)this + 85);
  v8 = (_DWORD *)*((_QWORD *)this + 6);
  if (v8[4] == -1)
    return 0;
  *((_BYTE *)this + 84) &= ~2u;
  v9 = *((_QWORD *)this + 26);
  if (v9)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)v9 + 24))(*((_QWORD *)this + 26));
    *((_QWORD *)this + 26) = 0;
    v8 = (_DWORD *)*((_QWORD *)this + 6);
  }
  *((_QWORD *)this + 30) = (char *)this + 85;
  *((_QWORD *)this + 31) = 20;
  return (*(unsigned int (**)(_DWORD *))(*(_QWORD *)v8 + 88))(v8) != 0;
}

BOOL Socket::get(Socket *this, int a2, int a3, int *a4, unsigned int *a5)
{
  int v6;
  void (***v7)(_QWORD, const char *, uint64_t, _QWORD);
  uint64_t v8;

  v6 = getsockopt(*((_DWORD *)this + 4), a2, a3, a4, a5);
  if (v6)
  {
    v7 = (void (***)(_QWORD, const char *, uint64_t, _QWORD))*((_QWORD *)this + 3);
    if (v7)
    {
      v8 = (*(uint64_t (**)(Socket *, _QWORD))(*(_QWORD *)this + 80))(this, 0);
      (**v7)(v7, "Socket.get", v8, *((unsigned int *)this + 4));
    }
  }
  return v6 == 0;
}

uint64_t Log::error(Log *this, const char *a2, ...)
{
  va_list v4;
  va_list va;

  va_start(va, a2);
  if (*((int *)this + 2) <= 4)
  {
    va_copy(v4, va);
    (*(void (**)(_QWORD, Log *, const char *, const char *, va_list *))(**((_QWORD **)this + 3) + 16))(*((_QWORD *)this + 3), this, "error", a2, &v4);
    ++*((_DWORD *)this + 11);
  }
  return 0;
}

uint64_t Log::info(Log *this, const char *a2, ...)
{
  va_list v4;
  va_list va;

  va_start(va, a2);
  if (*((int *)this + 2) <= 1)
  {
    va_copy(v4, va);
    (*(void (**)(_QWORD, Log *, const char *, const char *, va_list *))(**((_QWORD **)this + 3) + 16))(*((_QWORD *)this + 3), this, "info", a2, &v4);
    ++*((_DWORD *)this + 9);
  }
  return 0;
}

uint64_t FrameStream::done(FrameStream *this, int a2)
{
  NSObject *v4;
  char *v5;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(int *)(*((_QWORD *)this + 4) + 8) <= 1)
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *((_DWORD *)this + 20);
      v8[0] = 67109376;
      v8[1] = v7;
      v9 = 1024;
      v10 = a2;
      _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "[%d] sending eof on channel %d", (uint8_t *)v8, 0xEu);
    }

  }
  v5 = (char *)malloc_type_malloc(0x8CuLL, 0x500D4304uLL);
  if (!v5)
    return 0;
  *(_OWORD *)(v5 + 24) = 0u;
  *((_QWORD *)v5 + 5) = 0;
  *(_OWORD *)(v5 + 8) = 0u;
  *(_QWORD *)v5 = &unk_1E4136A88;
  *((_QWORD *)v5 + 3) = v5 + 112;
  *((_QWORD *)v5 + 4) = 24;
  *((_DWORD *)v5 + 32) = 167837720;
  *((_DWORD *)v5 + 33) = a2;
  return (*(uint64_t (**)(char *))(*((_QWORD *)this + 3) + 48))((char *)this + 24);
}

uint64_t LRU<Pending,LRULinks<Pending>::Deref>::pop(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!a2)
    return a2;
  if (*(_QWORD *)a1 == a2)
    *(_QWORD *)a1 = *(_QWORD *)(a2 + 16);
  v2 = *(_QWORD *)(a2 + 8);
  if (*(_QWORD *)(a1 + 8) == a2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    if (!v2)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (v2)
LABEL_6:
    *(_QWORD *)(v2 + 16) = *(_QWORD *)(a2 + 16);
LABEL_7:
  v3 = *(_QWORD *)(a2 + 16);
  if (v3)
    *(_QWORD *)(v3 + 8) = v2;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  --*(_DWORD *)(a1 + 16);
  return a2;
}

void set_nsobject_in_xpc_object(void *a1, const char *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a1;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v8;
    v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v6, a2, v7);

  }
}

uint64_t NSPPrivacyProxyTokenActivationResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  void *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        PBReaderReadData();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend((id)a1, "addActivatedTokenList:", v23);

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_35:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyObliviousHTTPConfigReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  NSPPrivacyProxyObliviousTargetInfo *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
          objc_msgSend((id)a1, "addObliviousTargets:", v17);
          if (PBReaderPlaceMark() && (NSPPrivacyProxyObliviousTargetInfoReadFrom(v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            continue;
          }

          return 0;
        case 2u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 8;
          goto LABEL_35;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 56) |= 1u;
          break;
        case 4u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 40;
          goto LABEL_35;
        case 5u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 48;
          goto LABEL_35;
        case 6u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 32;
LABEL_35:
          v27 = *(void **)(a1 + v20);
          *(_QWORD *)(a1 + v20) = v19;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_39;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_41;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_41:
      *(_DWORD *)(a1 + 16) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

NPTuscanyClient *tuscanyClientCreate(void *a1, void *a2)
{
  NPTunnelTuscany *v3;
  NSData *v4;
  NPTuscanyConfig *v5;
  NPTuscanyClient *v6;

  v3 = a1;
  v4 = a2;
  v5 = (NPTuscanyConfig *)operator new();
  NPTuscanyConfig::NPTuscanyConfig(v5);
  v6 = (NPTuscanyClient *)operator new();
  NPTuscanyClient::NPTuscanyClient(v6, v3, v4, v5);

  return v6;
}

void sub_19E932B70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  MEMORY[0x1A1AE9F9C](v4, 0x10B1C40DA21B781);

  _Unwind_Resume(a1);
}

NPTuscanyClient *tuscanyLoopbackClientCreate(void *a1)
{
  NPTunnelTuscany *v1;
  NPTuscanyConfig *v2;
  NPTuscanyClient *v3;

  v1 = a1;
  v2 = (NPTuscanyConfig *)operator new();
  NPTuscanyConfig::NPTuscanyConfig(v2);
  v3 = (NPTuscanyClient *)operator new();
  NPTuscanyClient::NPTuscanyClient(v3, v1, 0, v2);
  *(_QWORD *)v3 = &off_1E4136900;
  *((_QWORD *)v3 + 2) = &unk_1E41369E8;
  *((_QWORD *)v3 + 3) = &unk_1E4136A10;

  return v3;
}

void sub_19E932C58(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x1A1AE9F9C](v2, 0x10B1C40DA21B781);

  _Unwind_Resume(a1);
}

_QWORD *tuscanyClientDestroy(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = result[61];
    (*(void (**)(_QWORD *))(*result + 80))(result);
    result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v1 + 8))(v1);
    if (v2)
      JUMPOUT(0x1A1AE9F9CLL);
  }
  return result;
}

uint64_t tuscanyClientHandleConnectionConnected(uint64_t result)
{
  int v1;

  if (result)
  {
    v1 = 0;
    return (*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)result + 64))(result, &v1);
  }
  return result;
}

NPFrameStream *tuscanyClientHandleReadData(NPFrameStream *result, nw_frame_array_s *a2)
{
  if (result)
    return (NPFrameStream *)NPFrameStream::handleReadData(result, a2);
  return result;
}

uint64_t tuscanyClientGetAmountToRead(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 272);
    if (v2)
    {
      v3 = *(unsigned __int16 *)((*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 32))(v2) + 16);
      v4 = (_QWORD *)(*(_QWORD *)(v1 + 272) + 32);
    }
    else
    {
      v4 = (_QWORD *)(v1 + 304);
      v3 = 20;
    }
    return v3 - *v4;
  }
  return result;
}

BOOL tuscanyClientSendData(id *a1, void *a2, void *a3, unint64_t *a4)
{
  NPTunnelFlow *v7;
  NSData *v8;
  _BOOL8 v9;

  v7 = a2;
  v8 = a3;
  if (a1)
    v9 = NPTuscanyClient::sendData(a1, v7, v8, a4);
  else
    v9 = 0;

  return v9;
}

void sub_19E932E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL NPTuscanyClient::sendData(id *this, NPTunnelFlow *a2, NSData *a3, unint64_t *a4)
{
  NPTunnelFlow *v5;
  NSData *v6;
  id WeakRetained;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NPTunnelFlow *v14;
  id v15;
  int v16;
  id v17;
  id v18;
  unint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  size_t v25;
  dispatch_data_t subrange;
  int v27;
  NSObject *v28;
  size_t size;
  char *v30;
  char *v31;
  id v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (**v40)(_QWORD, _QWORD, _QWORD, _QWORD);
  NPTunnelFlow *v41;
  id *location;
  NSData *v44;
  _QWORD v46[4];
  void (**v47)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v48[4];
  NPTunnelFlow *v49;
  uint64_t *v50;
  uint64_t *v51;
  id *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _BYTE buf[24];
  void *v62;
  char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v44 = v6;
  v41 = v5;
  v56 = -[NSData length](v6, "length");
  v39 = -[NPTunnelFlow window](v5, "window");
  if (a4)
    *a4 = 0;
  location = this + 60;
  WeakRetained = objc_loadWeakRetained(this + 60);
  v8 = objc_msgSend(WeakRetained, "flowIsFirstFlow:", v41);

  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[NPTunnelFlow hashKey](v41, "hashKey");
      v12 = -[NPTunnelFlow identifier](v41, "identifier");
      v13 = -[NSData length](v6, "length");
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2048;
      v62 = (void *)v13;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "Flow %llu (%llu) sending %lu bytes of data through the tunnel", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v36 = -[NPTunnelFlow hashKey](v41, "hashKey");
    v37 = -[NPTunnelFlow identifier](v41, "identifier");
    v38 = -[NSData length](v6, "length");
    *(_DWORD *)buf = 134218496;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2048;
    v62 = (void *)v38;
    _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "Flow %llu (%llu) sending %lu bytes of data through the tunnel", buf, 0x20u);
  }

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke;
  v48[3] = &unk_1E41378C8;
  v52 = this;
  v14 = v41;
  v49 = v14;
  v50 = &v57;
  v51 = &v53;
  v40 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x1A1AEA9EC](v48);
  if (-[NPTunnelFlow state](v14, "state") == 1)
  {
    if (-[NSData length](v6, "length"))
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke_70;
      v46[3] = &unk_1E41378F0;
      v47 = v40;
      -[NSData enumerateByteRangesUsingBlock:](v6, "enumerateByteRangesUsingBlock:", v46);

    }
    else
    {
      v40[2](v40, 0, 0, 0);
    }
    if (*((_BYTE *)v58 + 24))
    {
      if (!-[NPTunnelFlow isBestEffort](v14, "isBestEffort"))
      {
        if (-[NSData length](v6, "length")
          || (v15 = objc_loadWeakRetained(location),
              v16 = objc_msgSend(v15, "flowIsFirstFlow:", v14),
              v15,
              v16))
        {
          v17 = objc_loadWeakRetained(location);
          objc_msgSend(v17, "startConnectionTimer");

        }
      }
    }
  }
  -[NPTunnelFlow identifier](v14, "identifier");
  v18 = this[33];
  if (v18)
    v19 = (unint64_t)v18 - 24;
  else
    v19 = 1256;
  v20 = v54;
  v21 = v54[3];
  if (v21)
  {
    v22 = 0;
    while (1)
    {
      if (v22 || !*((_BYTE *)v58 + 24))
        goto LABEL_38;
      if (v21 >= v19)
        LODWORD(v21) = v19;
      v23 = (int)v21 >= 1256 ? 1256 : v21;
      v22 = v23 < 1;
      if (v23 >= 1)
        break;
LABEL_37:
      v21 = v20[3];
      if (!v21)
        goto LABEL_38;
    }
    v24 = -[NSData length](v6, "length");
    v25 = v23 & ~(v23 >> 31);
    subrange = dispatch_data_create_subrange(&v6->super, v24 - v54[3], v25);
    v27 = -[NPTunnelFlow identifier](v14, "identifier");
    v28 = subrange;
    size = dispatch_data_get_size(v28);
    v30 = (char *)malloc_type_malloc(size + 140, 0x500D4304uLL);
    v31 = v30;
    if (!v30)
      goto LABEL_34;
    *(_OWORD *)(v30 + 24) = 0u;
    *(_OWORD *)(v30 + 8) = 0u;
    *(_QWORD *)v30 = &unk_1E4136A88;
    *((_QWORD *)v30 + 3) = v30 + 112;
    *((_QWORD *)v30 + 4) = 24;
    *((_QWORD *)v30 + 5) = 0;
    *((_DWORD *)v30 + 33) = v27;
    *((_WORD *)v30 + 65) = 2561;
    *((_WORD *)v30 + 64) = size + 24;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = ___ZN6Client5chunkEPU27objcproto16OS_dispatch_data8NSObjectj_block_invoke;
    v62 = &__block_descriptor_40_e47_B40__0__NSObject_OS_dispatch_data__8Q16r_v24Q32l;
    v63 = v30;
    dispatch_data_apply(v28, buf);
    if (((*((uint64_t (**)(id *, char *, _QWORD))*this + 26))(this, v31, 0) & 1) != 0)
    {

      v6 = v44;
      if ((size & 0x8000000000000000) == 0)
      {
        *(_DWORD *)(v39 + 12) -= v25;
        v54[3] -= v25;
LABEL_36:

        v20 = v54;
        goto LABEL_37;
      }
    }
    else
    {
LABEL_34:

      v6 = v44;
    }
    v32 = objc_loadWeakRetained(location);
    objc_msgSend(v32, "setFallbackReason:", 36);

    +[NPDiagnosticReport logInternalError:context:](NPDiagnosticReport, "logInternalError:context:", CFSTR("FailedToCreateDataFrame"), 0);
    *((_BYTE *)v58 + 24) = 0;
    goto LABEL_36;
  }
LABEL_38:
  if (a4)
  {
    v33 = -[NSData length](v6, "length");
    *a4 += v33 - v54[3];
  }
  v34 = *((_BYTE *)v58 + 24) != 0;

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);

  return v34;
}

void sub_19E9333A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  void *v31;
  uint64_t v32;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v32 - 192), 8);

  _Unwind_Resume(a1);
}

NPTuscanyClient *tuscanyClientSendClose(NPTuscanyClient *a1, void *a2)
{
  NPTunnelFlow *v3;

  v3 = a2;
  if (a1)
    a1 = (NPTuscanyClient *)NPTuscanyClient::sendClose(a1, v3);

  return a1;
}

void sub_19E9334B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t NPTuscanyClient::sendClose(NPTuscanyClient *this, NPTunnelFlow *a2)
{
  NPTunnelFlow *v3;
  uint64_t v4;

  v3 = a2;
  v4 = FrameStream::done(this, -[NPTunnelFlow identifier](v3, "identifier"));

  return v4;
}

void sub_19E933504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void tuscanyClientSendException(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = v11;
    v7 = v5;
    v8 = objc_msgSend(v7, "code");
    v9 = objc_msgSend(v6, "identifier");
    if ((unint64_t)(v8 - 1) >= 8)
      v10 = 6;
    else
      v10 = 0x100010306000303uLL >> (8 * (v8 - 1));
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 104))(a1, v9, v10 & 7);

  }
}

void sub_19E9335D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

FrameStream *tuscanyClientSendAcknowledge(FrameStream *result, int a2, int a3)
{
  if (result)
    return (FrameStream *)FrameStream::acknowledge(result, a2, a3, 1);
  return result;
}

uint64_t tuscanyClientGetInitialWindowSize()
{
  return 0x10000;
}

uint64_t tuscanyClientGetHeaderSize()
{
  return 20;
}

uint64_t tuscanyClientGetMaximumFrameSize(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 264);
  return result;
}

uint64_t tuscanyClientGetDataSize(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x14)
    __assert_rtn("tuscanyClientGetDataSize", "NPTuscanyClient.mm", 562, "dataLen > sizeof(Frame::Header)");
  if (*(_BYTE *)(a1 + 18) == 1)
    return *(unsigned __int16 *)(a1 + 16) - 24;
  else
    return 0;
}

NPTuscanyClient *tuscanyClientGetMaxDataSendSize(NPTuscanyClient *result, int a2)
{
  if (result)
    return (NPTuscanyClient *)NPTuscanyClient::maxSendSize(result, 1, a2);
  return result;
}

uint64_t NPTuscanyClient::maxSendSize(NPTuscanyClient *this, uint64_t a2, int a3)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  if (*((_QWORD *)this + 33))
    v3 = *((_QWORD *)this + 33);
  else
    v3 = 1280;
  if (!a3)
    return v3 - 24;
  if (a2 != 1)
    return v3 - 57;
  WeakRetained = objc_loadWeakRetained((id *)this + 60);
  v5 = objc_msgSend(WeakRetained, "currentMTU");

  if (v5 >= v3)
    v6 = v3;
  else
    v6 = v5;
  v7 = v6 <= 145;
  v8 = v6 - 145;
  if (v7)
    return 0;
  else
    return v8;
}

void sub_19E9336F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t tuscanyClientGetDayPassSessionCount(void *a1)
{
  uint64_t result;

  result = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (result)
    return *(unsigned int *)(result + 92);
  return result;
}

uint64_t tuscanyClientSetDayPassSessionCount(uint64_t result, int a2)
{
  *(_DWORD *)(result + 92) = a2;
  return result;
}

BOOL tuscanyClientValidateDayPass(void *a1)
{
  return objc_msgSend(a1, "length") == 96;
}

id tuscanyClientCreateFakeDayPass()
{
  __int128 v0;
  _OWORD v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v0 = 0xDCDCDCDCDCDCDCDCLL;
  *((_QWORD *)&v0 + 1) = 0xDCDCDCDCDCDCDCDCLL;
  v2[4] = v0;
  v2[5] = v0;
  v2[2] = v0;
  v2[3] = v0;
  v2[0] = v0;
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 96);
  return (id)objc_claimAutoreleasedReturnValue();
}

Client *tuscanyClientSendPing(Client *result)
{
  if (result)
    return (Client *)Client::ping(result, 0, 0);
  return result;
}

uint64_t tuscanyClientGetExceptionCounts(uint64_t result, _QWORD *a2)
{
  *a2 = 0;
  if (result)
  {
    *a2 = 6;
    result += 496;
  }
  return result;
}

const char *tuscanyClientGetNameForException(unsigned int a1)
{
  if (a1 > 5)
    return "<unknown>";
  else
    return (&Frame::Exception::label(int)::names)[a1];
}

NPFrameStream *tuscanyClientGetInitialData(NPFrameStream *a1, int a2)
{
  if (a1)
  {
    NPFrameStream::initialData(a1, a2);
    a1 = (NPFrameStream *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t tuscanyClientGetDayPassHostID(void *a1)
{
  uint64_t result;

  result = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (result)
    return *(unsigned __int16 *)(result + 80);
  return result;
}

uint64_t tuscanyClientGetDayPassPortID(void *a1)
{
  uint64_t result;

  result = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (result)
    return *(unsigned __int16 *)(result + 82);
  return result;
}

void tuscanyClientGetDayPassOriginAddressString(void *a1, void *a2, socklen_t a3)
{
  uint64_t v5;
  id v6;

  v6 = objc_retainAutorelease(a1);
  v5 = objc_msgSend(v6, "bytes");
  bzero(a2, a3);
  if (v5)
    inet_ntop(2, (const void *)(v5 + 80), (char *)a2, a3);

}

void sub_19E9338D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

_DWORD *tuscanyWindowCreate(int a1)
{
  _DWORD *result;
  int v3;

  result = (_DWORD *)operator new();
  if (a1 >= 0)
    v3 = a1;
  else
    v3 = a1 + 1;
  *result = 0;
  result[1] = v3 >> 1;
  result[2] = a1;
  result[3] = a1;
  return result;
}

uint64_t tuscanyWindowGetCredits(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

uint64_t tuscanyWindowDestroy(uint64_t result)
{
  if (result)
    JUMPOUT(0x1A1AE9F9CLL);
  return result;
}

uint64_t tuscanyWindowAddCredits(uint64_t result, int a2)
{
  if (result)
    *(_DWORD *)(result + 12) += a2;
  return result;
}

_DWORD *tuscanyWindowGetAmountToAck(_DWORD *result, int a2)
{
  int v2;
  signed int v3;
  BOOL v4;
  int v5;

  if (result)
  {
    v2 = result[1];
    v3 = *result + a2;
    v4 = v3 < v2;
    if (v3 >= v2)
      v5 = 0;
    else
      v5 = *result + a2;
    *result = v5;
    if (v4)
      return 0;
    else
      return (_DWORD *)v3;
  }
  return result;
}

void NPTuscanyConfig::NPTuscanyConfig(NPTuscanyConfig *this)
{
  uint64_t *v2;
  NSObject *v3;
  _BOOL4 v4;

  v2 = Log::DateTime::self(this);
  *(_QWORD *)this = &off_1E4136A68;
  *((_DWORD *)this + 2) = 0;
  *((_QWORD *)this + 2) = "NPTuscanyClient";
  *((_QWORD *)this + 3) = v2;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  *((_DWORD *)this + 14) = 0;
  *((_QWORD *)this + 8) = &off_1E4136558;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_DWORD *)this + 24) = 42;
  *((_QWORD *)this + 13) = &off_1E4136C30;
  *((_QWORD *)this + 14) = &unk_1E4136CA0;
  *((_QWORD *)this + 15) = 0x2FFFFFFFFLL;
  *((_QWORD *)this + 16) = 0;
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  *((_DWORD *)this + 2) = !v4;
}

uint64_t *Log::DateTime::self(Log::DateTime *this)
{
  unsigned __int8 v1;
  Log::Stderr *v3;
  uint64_t *v4;

  if ((v1 & 1) == 0)
  {
    if ((_DWORD)v3)
    {
      v4 = Log::Stderr::self(v3);
      Log::DateTime::self(void)::dt = (uint64_t)&off_1E4136D30;
      *(_QWORD *)algn_1EE52DF68 = v4;
    }
  }
  return &Log::DateTime::self(void)::dt;
}

void sub_19E933AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *Log::Stderr::self(Log::Stderr *this)
{
  unsigned __int8 v1;

  {
    Log::Stderr::self(void)::s = (uint64_t)&off_1E4136D08;
    unk_1EE52DF80 = 0;
  }
  return &Log::Stderr::self(void)::s;
}

void Log::Stderr::~Stderr(Log::Stderr *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Log::Stderr::emit(Log::Stderr *this, const char *__ptr, size_t __size)
{
  uint64_t result;

  fwrite(__ptr, __size, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  result = *((_QWORD *)this + 1);
  if (result)
    return (*(uint64_t (**)(uint64_t, const char *, size_t))(*(_QWORD *)result + 16))(result, __ptr, __size);
  return result;
}

void Log::DateTime::~DateTime(Log::DateTime *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Log::DateTime::format(Log::DateTime *this, const char **a2, const char *a3, const char *a4, char **a5)
{
  int v10;
  int v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  timeval v17;
  tm v18;
  char __str[1026];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  gettimeofday(&v17, 0);
  localtime_r(&v17.tv_sec, &v18);
  v10 = snprintf(__str, 0x400uLL, "%d-%.2d-%.2d %.2d:%.2d:%.2d,%.3d %s.%s: ", v18.tm_year + 1900, v18.tm_mon + 1, v18.tm_mday, v18.tm_hour, v18.tm_min, v18.tm_sec, v17.tv_usec / 1000, a2[2], a3);
  v11 = 1024 - v10;
  v12 = v10;
  v13 = &__str[v10];
  v14 = vsnprintf(v13, 1024 - v10, a4, *a5);
  if (v14 < 0 || v14 > v11)
    v14 = snprintf(v13, v11, "<log message too large>");
  v15 = v12 + v14;
  __str[v15] = 10;
  __str[(int)v15 + 1] = 0;
  return (*(uint64_t (**)(_QWORD, char *))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), __str);
}

void Log::~Log(Log *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t BufferPool::pop(BufferPool *this)
{
  return LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)this + 8, *((_QWORD *)this + 1));
}

uint64_t BufferPool::push(uint64_t this, Pending *a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a2)
  {
    v3 = this;
    if (*(_OWORD *)((char *)a2 + 8) != 0)
    {
      this = fprintf((FILE *)*MEMORY[0x1E0C80C10], "fatal: %s\n", "push (invalid link)");
      MEMORY[0] = 0;
    }
    v4 = *(_QWORD *)(v3 + 8);
    *((_QWORD *)a2 + 2) = v4;
    if (v4)
      *(_QWORD *)(v4 + 8) = a2;
    *(_QWORD *)(v3 + 8) = a2;
    if (!*(_QWORD *)(v3 + 16))
      *(_QWORD *)(v3 + 16) = a2;
    ++*(_DWORD *)(v3 + 24);
  }
  return this;
}

void BufferPool::read(BufferPool *this, int a2, void *a3)
{
  __assert_rtn("read", "buffer.h", 308, "\"unexpected Splicing call\"==0");
}

ssize_t Socket::read(Socket *this, void *a2, size_t a3)
{
  return recv(*((_DWORD *)this + 4), a2, a3, 0x80000);
}

void Socket::~Socket(Socket *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

Socket *Socket::close(Socket *this)
{
  int v2;

  v2 = *((_DWORD *)this + 4);
  if (v2 != -1)
    close(v2);
  *((_DWORD *)this + 4) = -1;
  return this;
}

uint64_t Socket::connect(uint64_t a1, uint64_t a2)
{
  int v4;
  const sockaddr *v5;
  socklen_t v6;
  int v7;
  void (***v8)(_QWORD, const char *, uint64_t, _QWORD);
  uint64_t v9;

  v4 = *(_DWORD *)(a1 + 16);
  v5 = (const sockaddr *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 48))(a2);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  v7 = connect(v4, v5, v6);
  if (v7)
  {
    v8 = *(void (****)(_QWORD, const char *, uint64_t, _QWORD))(a1 + 24);
    if (v8)
    {
      v9 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
      (**v8)(v8, "Socket.connect", v9, *(unsigned int *)(a1 + 16));
    }
  }
  if (v7)
    return -1;
  else
    return 0;
}

ssize_t Socket::write(Socket *this, const void *a2, size_t a3)
{
  return send(*((_DWORD *)this + 4), a2, a3, 0x80000);
}

ssize_t Socket::read(Socket *this, void *a2, int a3, int a4)
{
  return recv(*((_DWORD *)this + 4), a2, a3, a4 | 0x80000u);
}

ssize_t Socket::write(Socket *this, const void *a2, size_t a3, int a4)
{
  return send(*((_DWORD *)this + 4), a2, a3, a4 | 0x80000u);
}

uint64_t Socket::server(uint64_t a1, uint64_t a2, int a3, int a4)
{
  void (***v7)(_QWORD, const char *, uint64_t, _QWORD);
  uint64_t v8;
  int v9;
  const sockaddr *v10;
  socklen_t v11;
  void (***v12)(_QWORD, const char *, uint64_t, _QWORD);
  uint64_t v13;
  void (***v14)(_QWORD, const char *, uint64_t, _QWORD);
  uint64_t v15;
  int v17;

  v17 = a3;
  if (setsockopt(*(_DWORD *)(a1 + 16), 0xFFFF, 4, &v17, 4u))
  {
    v7 = *(void (****)(_QWORD, const char *, uint64_t, _QWORD))(a1 + 24);
    if (v7)
    {
      v8 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
      (**v7)(v7, "Socket.set", v8, *(unsigned int *)(a1 + 16));
    }
  }
  else
  {
    v9 = *(_DWORD *)(a1 + 16);
    v10 = (const sockaddr *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 48))(a2);
    v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
    if (bind(v9, v10, v11))
    {
      v12 = *(void (****)(_QWORD, const char *, uint64_t, _QWORD))(a1 + 24);
      if (v12)
      {
        v13 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
        (**v12)(v12, "Socket.bind", v13, *(unsigned int *)(a1 + 16));
      }
    }
    else
    {
      if (!listen(*(_DWORD *)(a1 + 16), a4))
        return 1;
      v14 = *(void (****)(_QWORD, const char *, uint64_t, _QWORD))(a1 + 24);
      if (v14)
      {
        v15 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
        (**v14)(v14, "Socket.listen", v15, *(unsigned int *)(a1 + 16));
      }
    }
  }
  return 0;
}

BOOL Socket::pending(Socket *this)
{
  return *__error() == 35 || *__error() == 35 || *__error() == 36;
}

char *Socket::strerror(Socket *this, int a2)
{
  int v2;
  unsigned int v4;
  int v5;

  if (a2)
  {
    v5 = 0;
    v4 = 4;
    if (Socket::get(this, 0xFFFF, 4103, &v5, &v4))
      v2 = v5;
    else
      v2 = 0;
  }
  else
  {
    v2 = *__error();
  }
  return strerror(v2);
}

uint64_t Socket::readmore(Socket *this)
{
  return 0;
}

ssize_t `non-virtual thunk to'Socket::write(Socket *this, const void *a2, size_t a3)
{
  return send(*((_DWORD *)this + 2), a2, a3, 0x80000);
}

void `non-virtual thunk to'Socket::~Socket(Socket *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

void NPTuscanyClient::NPTuscanyClient(NPTuscanyClient *this, NPTunnelTuscany *a2, NSData *a3, NPTuscanyConfig *a4)
{
  NPTunnelTuscany *v7;
  NSData *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *v11;

  v7 = a2;
  v8 = a3;
  Client::Client((uint64_t)this, (uint64_t)a4, (uint64_t)a4 + 64, (uint64_t)a4 + 56, (uint64_t)a4 + 104, 0);
  *(_QWORD *)this = &off_1E4136798;
  *((_QWORD *)this + 2) = &unk_1E4136880;
  *((_QWORD *)this + 3) = &unk_1E41368A8;
  objc_initWeak((id *)this + 60, v7);
  *((_QWORD *)this + 61) = a4;
  v9 = -[NPTunnelTuscany maxFrameSize](v7, "maxFrameSize");
  v10 = 1280;
  if (v9)
    v10 = v9;
  *((_QWORD *)this + 33) = v10;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 32) = 0u;
  *((_OWORD *)this + 33) = 0u;
  if (-[NSData length](v8, "length") == 96)
  {
    v11 = objc_retainAutorelease(v8);
    memcpy((char *)this + 544, -[NSData bytes](v11, "bytes"), -[NSData length](v11, "length"));
  }
  else
  {
    *((_OWORD *)this + 38) = 0u;
    *((_OWORD *)this + 39) = 0u;
    *((_OWORD *)this + 36) = 0u;
    *((_OWORD *)this + 37) = 0u;
    *((_OWORD *)this + 34) = 0u;
    *((_OWORD *)this + 35) = 0u;
  }

}

void sub_19E934274(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t Client::Client(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a3;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = a5;
  *(_DWORD *)(a1 + 72) = 0;
  *(_DWORD *)(a1 + 80) = a6;
  *(_BYTE *)(a1 + 84) = *(_BYTE *)(a1 + 84) & 0xC0 | 1;
  *(_QWORD *)(a5 + 24) = a1 + 16;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = &off_1E4136CC8;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_BYTE *)(a1 + 84) &= ~2u;
  *(_QWORD *)(a1 + 240) = a1 + 85;
  *(_QWORD *)(a1 + 248) = 20;
  *(_QWORD *)(a1 + 256) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_DWORD *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(_QWORD *)a1 = off_1E4136AC8;
  *(_QWORD *)(a1 + 16) = &unk_1E4136BB0;
  *(_QWORD *)(a1 + 24) = &unk_1E4136BD8;
  *(_QWORD *)(a1 + 352) = a4;
  *(_QWORD *)(a1 + 360) = 0;
  *(_QWORD *)(a1 + 368) = 0;
  *(_QWORD *)(a1 + 376) = 0;
  *(_QWORD *)(a1 + 384) = &off_1E4136DD8;
  Crypto::zero((_BYTE *)(a1 + 392), 0x20uLL);
  Crypto::zero((_BYTE *)(a1 + 424), 0x20uLL);
  *(_QWORD *)(a1 + 456) = -1;
  *(_QWORD *)(a1 + 464) = -1;
  *(_BYTE *)(a1 + 472) = 0;
  return a1;
}

void Client::~Client(Client *this)
{
  *(_QWORD *)this = off_1E4136AC8;
  *((_QWORD *)this + 2) = &unk_1E4136BB0;
  *((_QWORD *)this + 3) = &unk_1E4136BD8;
  Crypto::Session::~Session((Client *)((char *)this + 384));
  PendingStream::~PendingStream(this);
}

void NPTuscanyClient::~NPTuscanyClient(id *this)
{
  objc_destroyWeak(this + 60);
  *this = off_1E4136AC8;
  this[2] = &unk_1E4136BB0;
  this[3] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
}

{
  objc_destroyWeak(this + 60);
  *this = off_1E4136AC8;
  this[2] = &unk_1E4136BB0;
  this[3] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Client::flush(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 472))
  {
    Log::trace(*(Log **)(a1 + 32), "connected");
    *(_BYTE *)(a1 + 472) = 1;
  }
  return NPFrameStream::flush((uint64_t *)a1);
}

void NPTuscanyClient::dispose(id *this, const char *a2, int a3)
{
  id *v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = this + 60;
  WeakRetained = objc_loadWeakRetained(this + 60);

  if (WeakRetained)
  {
    if (a3)
    {
      nplog_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v13 = objc_loadWeakRetained(v6);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v14;
        v17 = 2080;
        v18 = a2;
        _os_log_error_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_ERROR, "%@: Dispose called with error: %s", (uint8_t *)&v15, 0x16u);

      }
      NPFrameStream::logCurrentState((NPFrameStream *)this, 0);
      v9 = objc_loadWeakRetained(v6);
      objc_msgSend(v9, "sendUsageReportWithRTT:geohash:fallbackReason:", 0xFFFFFFFFLL, 0, 31);

      v10 = objc_loadWeakRetained(v6);
      objc_msgSend(v10, "setFallbackReason:", 31);

      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
      +[NPDiagnosticReport logInternalError:context:](NPDiagnosticReport, "logInternalError:context:", CFSTR("TunnelDisposed"), v11);
      v12 = objc_loadWeakRetained(v6);
      objc_msgSend(v12, "cancelConnection");

    }
    objc_storeWeak(v6, 0);
  }
}

void sub_19E934660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t Client::traffic(_DWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t (*v5)(_DWORD *, const char *, uint64_t);
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_DWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t (*v10)(_DWORD *, uint64_t);

  if (((*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 200))(a1) & 1) != 0)
  {
    switch(*(_BYTE *)(a2 + 18))
    {
      case 0:
        result = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a1 + 152))(a1, a2);
        a1[95] += *(_DWORD *)(a2 + 24);
        return result;
      case 1:
        v7 = *(unsigned __int16 *)(a2 + 16) - 24;
        v8 = a2 + 24;
        v9 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 144);
        goto LABEL_10;
      case 3:
        v10 = *(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a1 + 160);
        goto LABEL_13;
      case 4:
        v7 = *(unsigned __int16 *)(a2 + 16) - 57;
        v8 = a2 + 57;
        v9 = *(uint64_t (**)(_DWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 176);
LABEL_10:
        result = v9(a1, a2, v8, v7);
        break;
      case 5:
        result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 184))(a1, a2, a2 + 25);
        break;
      case 9:
        v10 = *(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a1 + 168);
LABEL_13:
        result = v10(a1, a2);
        break;
      default:
        v5 = *(uint64_t (**)(_DWORD *, const char *, uint64_t))(*(_QWORD *)a1 + 80);
        v6 = "unsupported cmd";
        return v5(a1, v6, 1);
    }
  }
  else
  {
    v5 = *(uint64_t (**)(_DWORD *, const char *, uint64_t))(*(_QWORD *)a1 + 80);
    v6 = "decrypt failed";
    return v5(a1, v6, 1);
  }
  return result;
}

id NPTuscanyClient::tunnel(id *this)
{
  return objc_loadWeakRetained(this + 60);
}

void NPTuscanyClient::inbound(id *this, Frame::Data *a2, const void *a3, int a4)
{
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  size_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  id WeakRetained;
  void *v21;
  int v22;
  _QWORD destructor[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = *((unsigned int *)a2 + 5);
  kdebug_trace();
  nplog_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 && a4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained(this + 60);
      objc_msgSend(WeakRetained, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *((_DWORD *)a2 + 5);
      *(_DWORD *)buf = 138412802;
      v25 = v21;
      v26 = 1024;
      v27 = a4;
      v28 = 1024;
      v29 = v22;
      _os_log_debug_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEBUG, "%@: Received a %d-byte data frame for channel %u", buf, 0x18u);

    }
    v11 = this[34];
    this[34] = 0;
    v12 = a4;
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    destructor[0] = MEMORY[0x1E0C809B0];
    destructor[1] = 3221225472;
    destructor[2] = ___ZN15NPTuscanyClient7inboundERN5Frame4DataEPKvi_block_invoke;
    destructor[3] = &__block_descriptor_40_e5_v8__0l;
    destructor[4] = v11;
    v14 = dispatch_data_create(a3, v12, v13, destructor);

    v15 = objc_loadWeakRetained(this + 60);
    objc_msgSend(v15, "sendData:toClientFlow:", v14, v8);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_loadWeakRetained(this + 60);
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *((_DWORD *)a2 + 5);
      *(_DWORD *)buf = 138412546;
      v25 = v17;
      v26 = 1024;
      v27 = v18;
      _os_log_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_DEFAULT, "%@: Received a 0-byte data frame for channel %u", buf, 0x12u);

    }
    v14 = objc_loadWeakRetained(this + 60);
    v19 = (id)objc_msgSend(v14, "handleFlowClosed:withFallbackReason:", v8, 12);
  }

}

void sub_19E934A50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Ack *a2)
{
  NSObject *v4;
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*((_DWORD *)a2 + 6) & 0x80000000) != 0)
    __assert_rtn("inbound", "NPTuscanyClient.mm", 107, "ack.bytes >= 0");
  if (*((_DWORD *)a2 + 5))
  {
    nplog_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      WeakRetained = objc_loadWeakRetained(this + 60);
      objc_msgSend(WeakRetained, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *((_DWORD *)a2 + 5);
      v8 = *((_DWORD *)a2 + 6);
      v10 = 138412802;
      v11 = v7;
      v12 = 1024;
      v13 = v8;
      v14 = 1024;
      v15 = v9;
      _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "%@: Received a %u-byte ack for channel %u", (uint8_t *)&v10, 0x18u);

    }
    v5 = objc_loadWeakRetained(this + 60);
    objc_msgSend(v5, "increaseWindowSizeForFlow:byBytes:", *((unsigned int *)a2 + 5), *((int *)a2 + 6));

  }
}

void sub_19E934BD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Hack *a2)
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained(this + 60);
    objc_msgSend(WeakRetained, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *((_DWORD *)a2 + 5);
    v9 = 138412546;
    v10 = v6;
    v11 = 1024;
    v12 = v7;
    _os_log_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEFAULT, "%@: Received Hello ack with timestamp: %u", (uint8_t *)&v9, 0x12u);

  }
  v8 = objc_loadWeakRetained(this + 60);
  objc_msgSend(v8, "handleHelloAck:", *((unsigned int *)a2 + 5));

}

void sub_19E934D10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void NPTuscanyClient::inbound(id *this, Frame::Ping *a2)
{
  NSObject *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  void *v11;
  int v12;
  int v13;
  id v14;
  void *v15;
  int v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  _WORD v21[9];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  nplog_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    WeakRetained = objc_loadWeakRetained(this + 60);
    objc_msgSend(WeakRetained, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((_DWORD *)a2 + 8);
    v13 = *((_DWORD *)a2 + 9);
    *(_DWORD *)buf = 138412802;
    v19 = v11;
    v20 = 1024;
    *(_DWORD *)v21 = v12;
    v21[2] = 1024;
    *(_DWORD *)&v21[3] = v13;
    _os_log_debug_impl(&dword_19E8FE000, v4, OS_LOG_TYPE_DEBUG, "%@: Received ping response with RTT %u us, variation %u us", buf, 0x18u);

  }
  v5 = *((_DWORD *)a2 + 8);
  if (v5)
    v6 = v5 / 0x3E8 + 1;
  else
    v6 = 0xFFFFFFFFLL;
  v17 = 0;
  v16 = *((_DWORD *)a2 + 10);
  if ((_BYTE)v16)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", &v16, 4);
  else
    v7 = 0;
  nplog_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v14 = objc_loadWeakRetained(this + 60);
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v15;
    v20 = 2112;
    *(_QWORD *)v21 = v7;
    _os_log_debug_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_DEBUG, "%@: Received geohash %@ from ping response", buf, 0x16u);

  }
  v9 = objc_loadWeakRetained(this + 60);
  objc_msgSend(v9, "handlePingResponseRTT:geohash:", v6, v7);

}

void sub_19E934F24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t NPTuscanyClient::inbound(Log **this, Frame::Request *a2, const void *a3, int a4)
{
  Log::info(this[4], "unhandled request for %llx with %d bytes on channel %d", *((_QWORD *)a2 + 3), a4, *((_DWORD *)a2 + 5));
  return (*((uint64_t (**)(Log **, _QWORD, uint64_t))*this + 13))(this, *((unsigned int *)a2 + 5), 1);
}

void NPTuscanyClient::inbound(id *this, Frame::Exception *a2, const void *a3)
{
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  int v11;
  unint64_t v12;
  const char *v13;
  id *v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = *((char *)a2 + 24);
  if (v5 > 5)
    v6 = 0;
  else
    v6 = qword_19E995678[v5];
  nplog_obj();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained(this + 60);
    objc_msgSend(WeakRetained, "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = *((_DWORD *)a2 + 5);
    v12 = *((unsigned __int8 *)a2 + 24);
    if (v12 > 5)
      v13 = "<unknown>";
    else
      v13 = (&Frame::Exception::label(int)::names)[v12];
    v17 = 138413058;
    v18 = v9;
    v19 = 1024;
    v20 = v11;
    v21 = 1024;
    v22 = v12;
    v23 = 2080;
    v24 = v13;
    _os_log_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received exception on %u: %d (%s)", (uint8_t *)&v17, 0x22u);

  }
  v14 = &this[*((unsigned __int8 *)a2 + 24)];
  v14[62] = (char *)v14[62] + 1;
  v15 = objc_loadWeakRetained(this + 60);
  v16 = (id)objc_msgSend(v15, "handleFlowClosed:withFallbackReason:", *((unsigned int *)a2 + 5), v6);

}

void sub_19E935138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t Client::encrypt(uint64_t a1, uint64_t a2)
{
  if ((((uint64_t (*)(uint64_t, uint64_t, _QWORD))Frame::Prefix::meta(void)::meta[5
                                                                                         * *(unsigned __int8 *)(a2 + 18)
                                                                                         + 3])(a2, a1 + 384, 0) & 1) != 0)return 1;
  else
    return Log::error(*(Log **)(a1 + 32), "failed to encrypt");
}

uint64_t Client::decrypt(uint64_t a1, uint64_t a2)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))Frame::Prefix::meta(void)::meta[5
                                                                                           * *(unsigned __int8 *)(a2 + 18)
                                                                                           + 4])(a2, a1 + 384, 1);
}

uint64_t Client::transmit(Client *this, Pending *a2, Transfer *a3)
{
  uint64_t v5;

  if ((*((_BYTE *)this + 84) & 9) != 0
    || (v5 = (*(uint64_t (**)(Pending *, Pending *, Transfer *))(*(_QWORD *)a2 + 32))(a2, a2, a3),
        !(*(unsigned int (**)(Client *, uint64_t))(*(_QWORD *)this + 192))(this, v5)))
  {
    (*(void (**)(Pending *))(*(_QWORD *)a2 + 24))(a2);
    return 0;
  }
  else
  {
    Client::enqueue((uint64_t)this, a2);
    return 1;
  }
}

void `non-virtual thunk to'NPTuscanyClient::~NPTuscanyClient(id *this)
{
  objc_destroyWeak(this + 58);
  *(this - 2) = off_1E4136AC8;
  *this = &unk_1E4136BB0;
  this[1] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream((PendingStream *)(this - 2));
}

{
  objc_destroyWeak(this + 58);
  *(this - 2) = off_1E4136AC8;
  *this = &unk_1E4136BB0;
  this[1] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream((PendingStream *)(this - 2));
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t `non-virtual thunk to'Client::transmit(Client *this, Pending *a2, Transfer *a3)
{
  return Client::transmit((Client *)((char *)this - 24), a2, a3);
}

_BYTE *Client::dispose(Client *this, const char *a2, int a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  _BYTE *result;

  v6 = *((_QWORD *)this + 45);
  if (v6)
  {
    v7 = *(_DWORD *)(v6 + 24);
    if (v7 != -1)
      close(v7);
    *(_DWORD *)(v6 + 24) = -1;
    MEMORY[0x1A1AE9F9C](v6, 0x10A0C40F4DCF604);
    *((_QWORD *)this + 45) = 0;
  }
  v8 = *((_QWORD *)this + 34);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
    *((_QWORD *)this + 34) = 0;
  }
  FrameStream::dispose(this, a2, a3);
  *((_BYTE *)this + 472) = 0;
  Crypto::zero((_BYTE *)this + 392, 0x20uLL);
  result = Crypto::zero((_BYTE *)this + 424, 0x20uLL);
  *((_QWORD *)this + 57) = -1;
  *((_QWORD *)this + 58) = -1;
  return result;
}

void Client::inbound(Log **this, Frame::Data *a2, const void *a3, int a4)
{
  Log::fatal(this[4], "unhandled %d bytes on channel %d", a4, *((_DWORD *)a2 + 5));
}

uint64_t Client::inbound(Log **this, Frame::Ack *a2)
{
  return Log::info(this[4], "unhandled ack on channel %d", *((_DWORD *)a2 + 5));
}

uint64_t Client::inbound(Log **this, Frame::Hack *a2)
{
  return Log::info(this[4], "unhandled hack");
}

uint64_t Client::inbound(Log **this, Frame::Ping *a2)
{
  return Log::info(this[4], "unhandled ping");
}

uint64_t Client::inbound(Log **this, Frame::Request *a2, const void *a3, int a4)
{
  Log::info(this[4], "unhandled request for %llx with %d bytes on channel %d", *((_QWORD *)a2 + 3), a4, *((_DWORD *)a2 + 5));
  return (*((uint64_t (**)(Log **, _QWORD, uint64_t))*this + 13))(this, *((unsigned int *)a2 + 5), 1);
}

void Client::inbound(Client *this, Frame::Exception *a2, const void *a3)
{
  Log *v3;
  unint64_t v4;
  const char *v5;

  v3 = (Log *)*((_QWORD *)this + 4);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v4 > 5)
    v5 = "<unknown>";
  else
    v5 = (&Frame::Exception::label(int)::names)[v4];
  Log::fatal(v3, "unhandled exception '%s' on channel %d", v5, *((_DWORD *)a2 + 5));
}

BOOL Crypto::Session::encrypt(Crypto::Session *this, int8x16_t *a2, size_t __n, __int32 a4, unsigned int *a5)
{
  int v6;
  uint64_t v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  int8x16_t v14;
  _QWORD __dst[12];
  int8x16_t v16;
  uint64_t v17;

  v6 = __n;
  v17 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    LODWORD(v9) = *a5;
    if (*a5 == a4)
      v9 = 0;
    else
      v9 = v9;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9 + __n;
  if (v10 >= 0x61)
    __assert_rtn("encrypt", "crypto.h", 658, "plainsz + skpsz <= sizeof(pt)");
  v11 = (a4 + __n);
  if (a4)
  {
    memcpy(__dst, &a2[5], __n);
    Crypto::zero(a2, 0x40uLL);
    Crypto::Bits::stream_to((Crypto::Session *)((char *)this + 8), (Crypto *)a2, (unsigned __int8 *)a2, v11 + 80, *((_QWORD *)this + 9), 0);
    memcpy(&a2[5], __dst, v10);
    Crypto::zero(__dst, v10);
  }
  else
  {
    __dst[0] = *((_QWORD *)this + 9);
    Crypto::zero(a2, 0x40uLL);
    chacha20_all_64x64();
  }
  Crypto::zero((int8x16_t *)a2[4].i8, 0x10uLL);
  v12 = *((_QWORD *)this + 9);
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = a2[4];
    a2[4].i64[0] = v12;
    a2[4].i32[2] = v6 + 16;
    a2[4].i32[3] = a4;
    poly1305();
    a2[4] = veorq_s8(veorq_s8(v16, v14), a2[2]);
    *((_QWORD *)this + 9) += 2;
  }
  return v12 < 0xFFFFFFFFFFFFFFFELL;
}

uint64_t Crypto::Session::decrypt(Crypto::Session *this, int8x16_t *a2, unsigned int a3, unsigned __int32 a4, unsigned int *a5)
{
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  int8x16_t v12;
  __int8 v13;
  __int8 v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  unint64_t v31;
  Crypto *v32;
  int8x16_t *v33;
  int8x16_t v35;
  int8x16_t __dst[6];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v9 = *a5 + (unint64_t)a3;
    if (v9 >= 0x61)
      __assert_rtn("decrypt", "crypto.h", 737, "!_decsz || plainsz + decsz <= sizeof(pt)");
    v10 = a3;
  }
  else
  {
    v10 = a3;
    v9 = a4 + (unint64_t)a3;
  }
  __dst[0].i64[0] = *((_QWORD *)this + 10);
  Crypto::zero(a2, 0x40uLL);
  chacha20_all_64x64();
  v11 = *((_QWORD *)this + 10);
  if (v11 >= 0xFFFFFFFFFFFFFFFELL)
  {
    v14 = a2[4].i8[0];
    LOBYTE(v15) = a2[4].i8[1];
    LOBYTE(v16) = a2[4].i8[2];
    LOBYTE(v17) = a2[4].i8[3];
    LOBYTE(v18) = a2[4].i8[4];
    LOBYTE(v19) = a2[4].i8[5];
    LOBYTE(v20) = a2[4].i8[6];
    LOBYTE(v21) = a2[4].i8[7];
    v13 = a2[4].i8[8];
    LOBYTE(v22) = a2[4].i8[9];
    LOBYTE(v23) = a2[4].i8[10];
    LOBYTE(v24) = a2[4].i8[11];
    LOBYTE(v25) = a2[4].i8[12];
    LOBYTE(v26) = a2[4].i8[13];
    LOBYTE(v27) = a2[4].i8[14];
    LOBYTE(v28) = a2[4].i8[15];
  }
  else
  {
    v35 = a2[4];
    a2[4].i64[0] = v11;
    a2[4].i32[2] = a3 + 16;
    a2[4].i32[3] = a4;
    poly1305();
    v12 = veorq_s8(veorq_s8(__dst[0], v35), a2[2]);
    a2[4] = v12;
    v13 = v12.i8[8];
    v14 = v12.i8[0];
    v15 = (unint64_t)v12.i64[0] >> 8;
    v16 = (unint64_t)v12.i64[0] >> 16;
    v17 = (unint64_t)v12.i64[0] >> 24;
    v18 = HIDWORD(v12.i64[0]);
    v19 = (unint64_t)v12.i64[0] >> 40;
    v20 = HIWORD(v12.i64[0]);
    v21 = HIBYTE(v12.i64[0]);
    v22 = (unint64_t)v12.i64[1] >> 8;
    v23 = (unint64_t)v12.i64[1] >> 16;
    v24 = (unint64_t)v12.i64[1] >> 24;
    v25 = HIDWORD(v12.i64[1]);
    v26 = (unint64_t)v12.i64[1] >> 40;
    v27 = HIWORD(v12.i64[1]);
    v28 = HIBYTE(v12.i64[1]);
  }
  v29 = (v15 | v17 | v14 | v16 | v18 | v19 | v20 | v21 | v13 | v22 | v23 | v24 | v25 | v26 | v27 | v28)
      + 511;
  if ((v29 & 0x100) != 0)
  {
    v30 = *((_QWORD *)this + 10);
    if (a4)
    {
      v31 = v9 + 16;
      v32 = (Crypto *)&a2[4];
      v33 = a2 + 5;
      memcpy(__dst, v33, v10);
      Crypto::Bits::stream_to((Crypto::Session *)((char *)this + 40), v32, (unsigned __int8 *)v32, v31, v30, 1);
      memcpy(v33, __dst, v10);
      Crypto::zero(__dst, v10);
      v30 = *((_QWORD *)this + 10);
    }
    *((_QWORD *)this + 10) = v30 + 2;
  }
  return (v29 >> 8) & 1;
}

_BYTE *Crypto::zero(_BYTE *this, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = -(int)this & 7;
  if (v2)
  {
    if (v2 >= a2)
      v2 = a2;
    a2 -= v2;
    switch(v2)
    {
      case 1uLL:
        goto LABEL_11;
      case 2uLL:
        goto LABEL_10;
      case 3uLL:
        goto LABEL_9;
      case 4uLL:
        goto LABEL_8;
      case 5uLL:
        goto LABEL_7;
      case 6uLL:
        goto LABEL_6;
      case 7uLL:
        *this++ = 0;
LABEL_6:
        *this++ = 0;
LABEL_7:
        *this++ = 0;
LABEL_8:
        *this++ = 0;
LABEL_9:
        *this++ = 0;
LABEL_10:
        *this++ = 0;
LABEL_11:
        *this++ = 0;
        break;
      default:
        break;
    }
  }
  if (a2 >= 8)
  {
    v3 = a2 >> 3;
    do
    {
      *(_QWORD *)this = 0;
      this += 8;
      --v3;
    }
    while (v3);
  }
  switch(a2 & 7)
  {
    case 1uLL:
      goto LABEL_22;
    case 2uLL:
      goto LABEL_21;
    case 3uLL:
      goto LABEL_20;
    case 4uLL:
      goto LABEL_19;
    case 5uLL:
      goto LABEL_18;
    case 6uLL:
      goto LABEL_17;
    case 7uLL:
      *this++ = 0;
LABEL_17:
      *this++ = 0;
LABEL_18:
      *this++ = 0;
LABEL_19:
      *this++ = 0;
LABEL_20:
      *this++ = 0;
LABEL_21:
      *this++ = 0;
LABEL_22:
      *this = 0;
      break;
    default:
      return this;
  }
  return this;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t Crypto::Bits::stream_to(Crypto::Bits *this, Crypto *a2, unsigned __int8 *a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  if (a6)
  {
    chacha20_init_64x64();
    chacha20_update();
    return chacha20_final();
  }
  else
  {
    if (!a3)
      Crypto::zero(a2, a4);
    return chacha20_all_64x64();
  }
}

void PendingStream::~PendingStream(PendingStream *this)
{
  *(_QWORD *)this = off_1E41366A8;
  *((_QWORD *)this + 2) = &unk_1E4136718;
  *((_QWORD *)this + 3) = &unk_1E4136740;
  PendingStream::dispose(this, "dtor", 0);
}

uint64_t PendingStream::flush(_DWORD *a1, int *a2)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  int *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int *v13;
  void *v14;
  uint16_t v15;
  int v16;
  uint64_t v18;

  v4 = (uint64_t *)(a1 + 14);
  v5 = (_QWORD *)*((_QWORD *)a1 + 7);
  if (v5)
  {
    while (1)
    {
      v6 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**((_QWORD **)a1 + 6) + 40))(*((_QWORD *)a1 + 6), v5[3], v5[4]);
      if (v6 < 0)
      {
        if (((*(uint64_t (**)(_QWORD))(**((_QWORD **)a1 + 6) + 72))(*((_QWORD *)a1 + 6)) & 1) == 0)
        {
          v18 = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)a1 + 6) + 80))(*((_QWORD *)a1 + 6), 0);
          (*(void (**)(_DWORD *, uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, v18, 0);
          return v6;
        }
        v6 = 0;
      }
      else
      {
        v7 = (int *)*((_QWORD *)a1 + 4);
        if (v7[2] <= 0)
        {
          v8 = a1[20];
          v9 = (const char *)(*(uint64_t (**)(_QWORD *))(*v5 + 40))(v5);
          Log::trace((Log *)v7, "[%d] wrote %ld of <%s:%ld>", v8, v6, v9, v5[4]);
        }
      }
      v10 = v5[4] - v6;
      v5[3] += v6;
      v5[4] = v10;
      if (v10)
        break;
      v11 = LRU<Pending,LRULinks<Pending>::Deref>::pop((uint64_t)v4, *v4);
      (*(void (**)(uint64_t))(*(_QWORD *)v11 + 24))(v11);
      v5 = (_QWORD *)*v4;
      if (!*v4)
        goto LABEL_9;
    }
    (*(void (**)(_DWORD *, int *))(*(_QWORD *)a1 + 32))(a1, a2);
    v16 = a1[2];
    if ((v16 & 8) != 0)
      return a1[18];
    a1[2] = v16 | 8;
    v13 = a2;
    v14 = a1;
    v15 = 5;
    goto LABEL_13;
  }
LABEL_9:
  v12 = a1[2];
  if ((v12 & 8) != 0)
  {
    a1[2] = v12 & 0xFFFFFFF7;
    v13 = a2;
    v14 = a1;
    v15 = 8;
LABEL_13:
    AIO::rw(v13, v14, 8, v15);
  }
  return a1[18];
}

uint64_t Transfer::eof(Transfer *this)
{
  return 0;
}

uint64_t Transfer::advise(Transfer *this)
{
  return 0;
}

void Log::fatal(Log *this, const char *a2, ...)
{
  va_list v2;
  va_list va;

  va_start(va, a2);
  if (*((int *)this + 2) <= 5)
  {
    va_copy(v2, va);
    (*(void (**)(_QWORD, Log *, const char *, const char *, va_list *))(**((_QWORD **)this + 3) + 16))(*((_QWORD *)this + 3), this, "fatal", a2, &v2);
  }
  exit(1);
}

void Crypto::Session::~Session(Crypto::Session *this)
{
  _BYTE *v2;

  *(_QWORD *)this = &off_1E4136DD8;
  v2 = (char *)this + 8;
  Crypto::zero((_BYTE *)this + 8, 0x20uLL);
  Crypto::zero((_BYTE *)this + 40, 0x20uLL);
  *((_QWORD *)this + 9) = -1;
  *((_QWORD *)this + 10) = -1;
  Crypto::zero((_BYTE *)this + 40, 0x20uLL);
  Crypto::zero(v2, 0x20uLL);
}

uint64_t ___ZN15NPTuscanyClient7inboundERN5Frame4DataEPKvi_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 24))(*(_QWORD *)(a1 + 32));
}

uint64_t Client::enqueue(uint64_t this, Pending *a2)
{
  uint64_t v2;
  uint64_t v4;
  int *v5;
  int v6;
  const char *v7;

  v2 = this;
  if (a2)
  {
    if (*((_QWORD *)a2 + 1) || *((_QWORD *)a2 + 2))
    {
      this = fprintf((FILE *)*MEMORY[0x1E0C80C10], "fatal: %s\n", "append (invalid link)");
      MEMORY[0] = 0;
    }
    v4 = *(_QWORD *)(v2 + 64);
    *((_QWORD *)a2 + 1) = v4;
    if (v4)
      *(_QWORD *)(v4 + 16) = a2;
    *(_QWORD *)(v2 + 64) = a2;
    if (!*(_QWORD *)(v2 + 56))
      *(_QWORD *)(v2 + 56) = a2;
    ++*(_DWORD *)(v2 + 72);
    v5 = *(int **)(v2 + 32);
    if (v5[2] <= 0)
    {
      v6 = *(_DWORD *)(v2 + 80);
      v7 = (const char *)(*(uint64_t (**)(Pending *))(*(_QWORD *)a2 + 40))(a2);
      this = Log::trace((Log *)v5, "[%d] queued <%s:%ld>", v6, v7, *((_QWORD *)a2 + 4));
    }
  }
  if (*(_DWORD *)(v2 + 72) == 1)
  {
    if (*(_BYTE *)(v2 + 472))
      return NPFrameStream::flush((uint64_t *)v2);
  }
  return this;
}

void NPTuscanyLoopbackClient::~NPTuscanyLoopbackClient(id *this)
{
  objc_destroyWeak(this + 60);
  *this = off_1E4136AC8;
  this[2] = &unk_1E4136BB0;
  this[3] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
}

{
  objc_destroyWeak(this + 60);
  *this = off_1E4136AC8;
  this[2] = &unk_1E4136BB0;
  this[3] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 48));
  PendingStream::~PendingStream((PendingStream *)this);
  JUMPOUT(0x1A1AE9F9CLL);
}

void NPTuscanyLoopbackClient::dispose(id *this, const char *__s1, int a3)
{
  if (strcmp(__s1, "unsupported cmd"))
    NPTuscanyClient::dispose(this, __s1, a3);
}

void NPTuscanyLoopbackClient::inbound(id *this, Frame::Request *a2, const void *a3, int a4)
{
  _DWORD v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4[5] = *((_DWORD *)a2 + 5);
  NPTuscanyClient::inbound(this, (Frame::Data *)v4, a3, a4);
}

uint64_t NPTuscanyLoopbackClient::encrypt()
{
  return 1;
}

uint64_t NPTuscanyLoopbackClient::decrypt()
{
  return 1;
}

void `non-virtual thunk to'NPTuscanyLoopbackClient::~NPTuscanyLoopbackClient(id *this)
{
  objc_destroyWeak(this + 58);
  *(this - 2) = off_1E4136AC8;
  *this = &unk_1E4136BB0;
  this[1] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream((PendingStream *)(this - 2));
}

{
  objc_destroyWeak(this + 58);
  *(this - 2) = off_1E4136AC8;
  *this = &unk_1E4136BB0;
  this[1] = &unk_1E4136BD8;
  Crypto::Session::~Session((Crypto::Session *)(this + 46));
  PendingStream::~PendingStream((PendingStream *)(this - 2));
  JUMPOUT(0x1A1AE9F9CLL);
}

void ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unsigned __int16 *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id WeakRetained;
  id v14;
  int v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  double v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  NSObject *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  double v34;
  NSObject *v35;
  _BOOL4 v36;
  uint64_t v37;
  unsigned __int8 *v38;
  uint8_t *v39;
  unsigned int v40;
  NSObject *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  BOOL v52;
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  const __CFString *v57;
  NSObject *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  id v67;
  void *v68;
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE buf[28];
  __int16 v74;
  double v75;
  uint8_t v76[32];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  v7 = *(unsigned __int16 **)(a1 + 56);
  v8 = NPTuscanyClient::maxSendSize((NPTuscanyClient *)v7, objc_msgSend(*(id *)(a1 + 32), "identifier"), 1);
  if (a4 >= v8)
    v9 = v8;
  else
    v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "extraFlowProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "serviceID");

  v71 = 0;
  v72 = 0;
  v69[0] = v11;
  v69[1] = a2;
  v70 = (unsigned __int16)v9;
  HIDWORD(v70) = objc_msgSend(*(id *)(a1 + 32), "identifier");
  LODWORD(v71) = 0x10000;
  v12 = (id *)(v7 + 240);
  WeakRetained = objc_loadWeakRetained((id *)v7 + 60);
  LODWORD(v11) = objc_msgSend(WeakRetained, "flowIsFirstFlow:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v11)
  {
    v14 = objc_loadWeakRetained((id *)v7 + 60);
    v15 = objc_msgSend(v14, "dayPassSessionCounter");

    v16 = objc_loadWeakRetained((id *)v7 + 60);
    objc_msgSend(v16, "dayPassCreationDate");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      nplog_obj();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_loadWeakRetained(v12);
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v76 = 138412290;
        *(_QWORD *)&v76[4] = v28;
        _os_log_impl(&dword_19E8FE000, v26, OS_LOG_TYPE_DEFAULT, "%@: No DayPass available, cannot establish tunnel connection", v76, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      goto LABEL_40;
    }
    *((_DWORD *)v7 + 159) = v15;
    if (v7[313])
    {
      inet_ntop(2, v7 + 312, (char *)v76, 0x2Eu);
      nplog_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_loadWeakRetained((id *)v7 + 60);
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *((_DWORD *)v7 + 159);
        objc_msgSend(v68, "timeIntervalSinceNow");
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v20;
        *(_WORD *)&buf[18] = 2080;
        *(_QWORD *)&buf[20] = v76;
        v74 = 2048;
        v75 = fabs(v21);
        _os_log_impl(&dword_19E8FE000, v17, OS_LOG_TYPE_DEFAULT, "%@: DayPass session count = %u, addr = %s, age = %f", buf, 0x26u);

      }
    }
    else
    {
      nplog_obj();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v67 = objc_loadWeakRetained((id *)v7 + 60);
        objc_msgSend(v67, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *((_DWORD *)v7 + 159);
        v32 = v7[312];
        v33 = v7[313];
        objc_msgSend(v68, "timeIntervalSinceNow");
        *(_DWORD *)v76 = 138413314;
        *(_QWORD *)&v76[4] = v30;
        *(_WORD *)&v76[12] = 1024;
        *(_DWORD *)&v76[14] = v31;
        *(_WORD *)&v76[18] = 1024;
        *(_DWORD *)&v76[20] = v32;
        *(_WORD *)&v76[24] = 1024;
        *(_DWORD *)&v76[26] = v33;
        *(_WORD *)&v76[30] = 2048;
        v77[0] = fabs(v34);
        _os_log_impl(&dword_19E8FE000, v29, OS_LOG_TYPE_DEFAULT, "%@: DayPass session count = %u, hostid = %u, portid = %u, age = %f", v76, 0x28u);

      }
    }
    nplog_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);

    if (v36)
    {
      v37 = 0;
      LOBYTE(v77[0]) = 0;
      memset(v76, 0, sizeof(v76));
      v38 = (unsigned __int8 *)(v7 + 288);
      do
      {
        v39 = &v76[v37];
        v40 = *v38++;
        *v39 = Frame::Ticket::tohex(void *,void const*,unsigned long)::hexdigits[(unint64_t)v40 >> 4];
        v39[1] = Frame::Ticket::tohex(void *,void const*,unsigned long)::hexdigits[v40 & 0xF];
        v37 += 2;
      }
      while (v37 != 32);
      nplog_obj();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v60 = objc_loadWeakRetained((id *)v7 + 60);
        objc_msgSend(v60, "identifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v61;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v76;
        _os_log_debug_impl(&dword_19E8FE000, v41, OS_LOG_TYPE_DEBUG, "%@: DayPass shared MAC %s", buf, 0x16u);

      }
    }
    *((_BYTE *)v7 + 84) &= ~1u;
    v42 = (unsigned __int16)v70;
    v43 = (char *)malloc_type_malloc((unsigned __int16)v70 + 265, 0xFDFA9477uLL);
    v44 = v43;
    if (v43)
    {
      *((_QWORD *)v43 + 5) = 0;
      *(_OWORD *)(v43 + 24) = 0u;
      *(_OWORD *)(v43 + 8) = 0u;
      *(_QWORD *)v43 = &off_1E4136D58;
      v45 = *((_OWORD *)v7 + 36);
      v46 = *((_OWORD *)v7 + 37);
      v47 = *((_OWORD *)v7 + 38);
      *(_OWORD *)(v43 + 188) = *((_OWORD *)v7 + 39);
      *(_OWORD *)(v43 + 172) = v47;
      *(_OWORD *)(v43 + 156) = v46;
      *(_OWORD *)(v43 + 140) = v45;
      *((_DWORD *)v43 + 51) = 0;
      *((_DWORD *)v43 + 34) = 167903320;
      *((_QWORD *)v43 + 3) = v43 + 120;
      *((_QWORD *)v43 + 4) = v42 + 145;
      v48 = *((_OWORD *)v7 + 39);
      *(_OWORD *)v76 = v48;
      *(_OWORD *)buf = v48;
      *(_DWORD *)v76 = v48 ^ 0x53497865;
      *(_DWORD *)buf = v48 ^ 0x7865534F;
      hchacha((unint64_t)(v7 + 272), (int *)v76, (int *)v7 + 106, 0x14uLL);
      hchacha((unint64_t)(v7 + 272), (int *)buf, (int *)v7 + 98, 0x14uLL);
      Crypto::zero(v76, 0x10uLL);
      Crypto::zero(buf, 0x10uLL);
      *((_QWORD *)v7 + 57) = 0;
      *((_QWORD *)v7 + 58) = 1;
      v49 = (*(uint64_t (**)(char *))(*(_QWORD *)v44 + 32))(v44);
      if ((*(unsigned int (**)(unsigned __int16 *, uint64_t))(*(_QWORD *)v7 + 192))(v7, v49))
      {
        if (Client::populate((Log **)v7, v44 + 208, (unint64_t)v69, v50))
        {
          v51 = *((_DWORD *)v7 + 159);
          if (v51 != -1)
          {
            *((_DWORD *)v7 + 159) = v51 + 1;
            Client::enqueue((uint64_t)v7, (Pending *)v44);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            v52 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
            v53 = objc_loadWeakRetained((id *)v7 + 60);
            v54 = v53;
            if (v52)
            {
              objc_msgSend(v53, "setFallbackReason:", 32);
              v57 = CFSTR("HelloFrameFailed");
            }
            else
            {
              v55 = objc_msgSend(v53, "timestamps");
              if (v55 && g_recordTimestamps && !*(_QWORD *)(v55 + 72))
                *(_QWORD *)(v55 + 72) = mach_absolute_time();

              v56 = objc_loadWeakRetained(v12);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v56, "start");

              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
                goto LABEL_40;
              v54 = objc_loadWeakRetained(v12);
              objc_msgSend(v54, "setFallbackReason:", 33);
              v57 = CFSTR("TunnelStartFailed");
            }

            +[NPDiagnosticReport logInternalError:context:](NPDiagnosticReport, "logInternalError:context:", v57, 0);
LABEL_40:
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
              && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != v9)
            {
              nplog_obj();
              v58 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                v62 = objc_loadWeakRetained(v12);
                objc_msgSend(v62, "identifier");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v64 = objc_msgSend(*(id *)(a1 + 32), "hashKey");
                v65 = objc_msgSend(*(id *)(a1 + 32), "identifier");
                v66 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v9;
                *(_DWORD *)v76 = 138413058;
                *(_QWORD *)&v76[4] = v63;
                *(_WORD *)&v76[12] = 2048;
                *(_QWORD *)&v76[14] = v64;
                *(_WORD *)&v76[22] = 2048;
                *(_QWORD *)&v76[24] = v65;
                LOWORD(v77[0]) = 2048;
                *(_QWORD *)((char *)v77 + 2) = v66;
                _os_log_debug_impl(&dword_19E8FE000, v58, OS_LOG_TYPE_DEBUG, "%@: Flow %llu (%llu) initial data did not entirely fit in the Hello/Request frame, %lu bytes left over", v76, 0x2Au);

              }
              objc_msgSend(*(id *)(a1 + 32), "setInitialBytesLeftOver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - v9);
            }

            goto LABEL_46;
          }
        }
      }
      free(v44);
    }
    Log::fatal(*((Log **)v7 + 4), "can't create Hello");
  }
  v22 = (unsigned __int16)v70;
  v23 = (char *)malloc_type_malloc((unsigned __int16)v70 + 169, 0x973590DuLL);
  v25 = v23;
  if (v23)
  {
    *((_QWORD *)v23 + 5) = 0;
    *(_OWORD *)(v23 + 24) = 0u;
    *(_OWORD *)(v23 + 8) = 0u;
    *(_QWORD *)v23 = &off_1E4136D98;
    if (Client::populate((Log **)v7, v23 + 112, (unint64_t)v69, v24))
    {
      v25[3] = v25 + 14;
      v25[4] = v22 + 57;
    }
    else
    {
      free(v25);
      v25 = 0;
    }
  }
  Client::enqueue((uint64_t)v7, (Pending *)v25);
LABEL_46:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) -= v9;
  }
  else
  {
    v59 = objc_loadWeakRetained(v12);
    objc_msgSend(*(id *)(a1 + 32), "setFallbackReason:", objc_msgSend(v59, "fallbackReason"));

  }
}

void sub_19E9368F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t ___ZN15NPTuscanyClient8sendDataEP12NPTunnelFlowP6NSDataPm_block_invoke_70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a5 = 1;
  return result;
}

uint64_t Client::populate(Log **a1, char *a2, unint64_t a3, uint64_t a4)
{
  char *v5;
  Log **v6;
  int32x2_t *v7;
  size_t v8;
  uint64_t v9;
  int32x2_t *v10;
  char *v11;
  const void *v12;
  __int32 v13;
  uint64_t v14;
  size_t v15;
  _QWORD v17[2];

  v5 = a2;
  v6 = a1;
  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = (int32x2_t *)(a3 - 40);
  do
  {
    v8 = v7[7].u16[0];
    MEMORY[0x1E0C80A78](a1, a2, a3, a4);
    v10 = (int32x2_t *)((char *)v17 - v9);
    v11 = (char *)&v17[8] - v9;
    Log::trace(v6[4], "populating (ch %d, len %ld)", v7[7].i32[1], v8);
    v12 = (const void *)v7[6];
    v10[11] = v7[5];
    v13 = v7[7].i32[1];
    v10[13] = 0;
    v10[14] = 0;
    v10[10].i32[1] = v13;
    v10[12] = vrev64_s32(v7[8]);
    v10[10].i16[1] = 2564;
    v10[10].i16[0] = v8 + 57;
    v10[15].i8[0] = v7[9].i8[0];
    memcpy((char *)&v10[15] + 1, v12, v8);
    v14 = (*((uint64_t (**)(Log **, char *))*v6 + 24))(v6, v11);
    if ((v14 & 1) == 0)
      break;
    v15 = v8 + 57;
    a1 = (Log **)memcpy(v5, v11, v15);
    v5 += v15;
    v7 += 5;
  }
  while ((unint64_t)v7 < a3);
  return v14;
}

void Client::Hello::~Hello(Client::Hello *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Client::Hello::header(Client::Hello *this)
{
  return (uint64_t)this + 120;
}

void Client::Query::~Query(Client::Query *this)
{
  JUMPOUT(0x1A1AE9F9CLL);
}

uint64_t Client::Query::header(Client::Query *this)
{
  return (uint64_t)this + 112;
}

uint64_t ___ZN6Client5chunkEPU27objcproto16OS_dispatch_data8NSObjectj_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  (***(void (****)(_QWORD, uint64_t, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 32), a4, a5);
  return 1;
}

BOOL Client::ping(Client *this, int a2, uint64_t a3)
{
  char *v6;

  v6 = (char *)malloc_type_malloc(0xA0uLL, 0x500D4304uLL);
  if (!v6)
    return 0;
  *(_OWORD *)(v6 + 24) = 0u;
  *((_QWORD *)v6 + 5) = 0;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &unk_1E4136A88;
  *((_QWORD *)v6 + 3) = v6 + 112;
  *((_QWORD *)v6 + 4) = 44;
  *((_QWORD *)v6 + 17) = a3;
  *((_QWORD *)v6 + 18) = 0;
  *((_DWORD *)v6 + 32) = 168362028;
  *((_DWORD *)v6 + 33) = a2;
  return ((*(uint64_t (**)(Client *, char *, _QWORD))(*(_QWORD *)this + 208))(this, v6, 0) & 1) != 0;
}

void sub_19E938938(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_19E938AA0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

BOOL NSPPrivacyProxyBAAValidationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
        goto LABEL_24;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
LABEL_24:
        v20 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_26:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    PBReaderReadData();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = 16;
    goto LABEL_24;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL NSPPrivacyProxyTokenInfoReadFrom(char *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_24;
        case 2u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_24;
        case 3u:
          PBReaderReadData();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(a1, "addUnactivatedTokenList:", v19);
          goto LABEL_25;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
LABEL_24:
          v19 = *(void **)&a1[v18];
          *(_QWORD *)&a1[v18] = v17;
          goto LABEL_25;
        case 5u:
          PBReaderReadData();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(a1, "addTokenRequestList:", v19);
LABEL_25:

          goto LABEL_26;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_26:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19E94AE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_19E94B1B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 256), 8);
  _Block_object_dispose((const void *)(v37 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_19E94CAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_19E94F374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E94FB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_19E9506E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void np_protocol_input_frame_finalizer(void *a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a1;

  nw_frame_reset();
}

void np_tunnel_flow_output_frame_finalizer(void *a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a1;
  objc_msgSend(a3, "handleOutputFrame:send:", v5, a2);
  nw_frame_reset();

}

id nplog_large_obj()
{
  if (nplog_large_obj_g_large_init != -1)
    dispatch_once(&nplog_large_obj_g_large_init, &__block_literal_global_3);
  return (id)nplog_large_obj_large_log_obj;
}

void __nplog_large_obj_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.networkserviceproxy", "Large");
  v1 = (void *)nplog_large_obj_large_log_obj;
  nplog_large_obj_large_log_obj = (uint64_t)v0;

}

void nsp_print_backtrace()
{
  int v0;
  char **v1;
  char **v2;
  uint64_t v3;
  char **v4;
  NSObject *v5;
  char *v6;
  uint8_t buf[4];
  char *v8;
  void *v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)v9 = 0u;
  v10 = 0u;
  v0 = backtrace(v9, 128);
  v1 = backtrace_symbols(v9, v0);
  v2 = v1;
  if (v0 >= 1)
  {
    v3 = v0;
    v4 = v1;
    do
    {
      nplog_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *v4;
        *(_DWORD *)buf = 136315138;
        v8 = v6;
        _os_log_error_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_ERROR, "    %s", buf, 0xCu);
      }

      ++v4;
      --v3;
    }
    while (v3);
  }
  free(v2);
}

uint64_t NSPPrivacyProxySignedConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  NSPPrivacyProxyConfiguration *v17;
  uint64_t result;
  uint64_t v19;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = objc_alloc_init(NSPPrivacyProxyConfiguration);
          objc_storeStrong((id *)(a1 + 24), v17);
          if (PBReaderPlaceMark() && (NSPPrivacyProxyConfigurationReadFrom((uint64_t)v17, a2) & 1) != 0)
          {
            PBReaderRecallMark();
            goto LABEL_27;
          }

          return 0;
        case 2u:
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(a1 + 32);
          *(_QWORD *)(a1 + 32) = v19;

          continue;
        case 3u:
          PBReaderReadData();
          v17 = (NSPPrivacyProxyConfiguration *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend((id)a1, "addCertificates:", v17);
LABEL_27:

          continue;
        case 4u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          *(_BYTE *)(a1 + 40) |= 1u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v24 = *v3;
        v25 = *(_QWORD *)(a2 + v24);
        if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
        *(_QWORD *)(a2 + v24) = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0)
          goto LABEL_36;
        v21 += 7;
        v14 = v22++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_38;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_38:
      *(_DWORD *)(a1 + 8) = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

unint64_t NSPPrivacyProxyConfigurationRawConfig(void *a1, unint64_t a2)
{
  id v3;
  _BYTE *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;

  v3 = a1;
  if (a2)
  {
    v4 = (_BYTE *)objc_msgSend(objc_alloc(MEMORY[0x1E0D82B90]), "initWithData:", v3);
    if (v4)
    {
      v5 = (int *)MEMORY[0x1E0D82BF0];
      v6 = (int *)MEMORY[0x1E0D82BD8];
      v7 = (int *)MEMORY[0x1E0D82BC8];
      v8 = (int *)MEMORY[0x1E0D82BB8];
      do
      {
        if (*(_QWORD *)&v4[*v5] >= *(_QWORD *)&v4[*v6] || v4[*v7])
          break;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = *v5;
          v13 = *(_QWORD *)&v4[v12];
          if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
            break;
          v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0)
            goto LABEL_14;
          v9 += 7;
          if (v10++ >= 9)
          {
            v11 = 0;
            v16 = v4[*v7];
            goto LABEL_16;
          }
        }
        v4[*v7] = 1;
LABEL_14:
        v16 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_16:
        if (v16 || (v11 & 7) == 4)
          break;
        if ((v11 >> 3) == 1)
        {
          PBReaderReadData();
          *(_QWORD *)a2 = (id)objc_claimAutoreleasedReturnValue();
          a2 = v4[*v7] == 0;
          goto LABEL_23;
        }
      }
      while ((PBReaderSkipValueWithTag() & 1) != 0);
    }
    a2 = 0;
LABEL_23:

  }
  return a2;
}

uint64_t NSPPrivacyProxyConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t result;
  NSPPrivacyProxyAuthenticationInfo *v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_88;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_90;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_88:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_90:
        v50 = 128;
        goto LABEL_107;
      case 2u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 136) |= 4u;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v25 |= (unint64_t)(v28 & 0x7F) << v23;
            if (v28 < 0)
            {
              v23 += 7;
              v14 = v24++ >= 9;
              if (v14)
              {
                v25 = 0;
                goto LABEL_94;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_94:
        *(_BYTE *)(a1 + 132) = v25 != 0;
        goto LABEL_108;
      case 3u:
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 136) |= 1u;
        while (2)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
            *(_QWORD *)(a2 + v32) = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v14 = v30++ >= 9;
              if (v14)
              {
                v31 = 0;
                goto LABEL_98;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v31 = 0;
LABEL_98:
        *(_QWORD *)(a1 + 8) = v31;
        goto LABEL_108;
      case 5u:
        v36 = objc_alloc_init(NSPPrivacyProxyAuthenticationInfo);
        objc_storeStrong((id *)(a1 + 16), v36);
        if (!PBReaderPlaceMark()
          || (NSPPrivacyProxyAuthenticationInfoReadFrom((uint64_t)v36, a2) & 1) == 0)
        {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 6u:
        v36 = objc_alloc_init(NSPPrivacyProxyPolicyTierMap);
        objc_msgSend((id)a1, "addPolicyTierMap:", v36);
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyPolicyTierMapReadFrom((uint64_t)v36, a2) & 1) == 0)
          goto LABEL_110;
        goto LABEL_83;
      case 7u:
        v36 = objc_alloc_init(NSPPrivacyProxyProxyInfo);
        objc_msgSend((id)a1, "addProxies:", v36);
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyProxyInfoReadFrom(v36, a2) & 1) == 0)
          goto LABEL_110;
        goto LABEL_83;
      case 8u:
        v36 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
        objc_msgSend((id)a1, "addPathWeights:", v36);
        goto LABEL_61;
      case 9u:
        v36 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        objc_msgSend((id)a1, "addResolvers:", v36);
        goto LABEL_66;
      case 0xAu:
        v37 = 0;
        v38 = 0;
        v19 = 0;
        while (2)
        {
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 == -1 || v40 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v41 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 1;
            v19 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              v14 = v38++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_102;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_102:
        v50 = 48;
        goto LABEL_107;
      case 0xBu:
        v36 = objc_alloc_init(NSPPrivacyProxyProxyPathWeight);
        objc_msgSend((id)a1, "addFallbackPathWeights:", v36);
LABEL_61:
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyProxyPathWeightReadFrom((uint64_t)v36, a2) & 1) == 0)
          goto LABEL_110;
        goto LABEL_83;
      case 0xCu:
        PBReaderReadString();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = 104;
        goto LABEL_70;
      case 0xDu:
        v36 = objc_alloc_init(NSPPrivacyProxyResolverInfo);
        objc_storeStrong((id *)(a1 + 24), v36);
LABEL_66:
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyResolverInfoReadFrom((uint64_t)v36, a2) & 1) == 0)
          goto LABEL_110;
        goto LABEL_83;
      case 0xEu:
        PBReaderReadString();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = 32;
LABEL_70:
        v44 = *(void **)(a1 + v43);
        *(_QWORD *)(a1 + v43) = v42;

        goto LABEL_108;
      case 0xFu:
        v36 = objc_alloc_init(NSPPrivacyProxyObliviousHTTPConfig);
        objc_msgSend((id)a1, "addObliviousConfigs:", v36);
        if (!PBReaderPlaceMark()
          || (NSPPrivacyProxyObliviousHTTPConfigReadFrom((uint64_t)v36, a2) & 1) == 0)
        {
          goto LABEL_110;
        }
        goto LABEL_83;
      case 0x10u:
        v45 = 0;
        v46 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 136) |= 2u;
        while (2)
        {
          v47 = *v3;
          v48 = *(_QWORD *)(a2 + v47);
          if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
            *(_QWORD *)(a2 + v47) = v48 + 1;
            v19 |= (unint64_t)(v49 & 0x7F) << v45;
            if (v49 < 0)
            {
              v45 += 7;
              v14 = v46++ >= 9;
              if (v14)
              {
                LODWORD(v19) = 0;
                goto LABEL_106;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_106:
        v50 = 80;
LABEL_107:
        *(_DWORD *)(a1 + v50) = v19;
        goto LABEL_108;
      case 0x11u:
        v36 = objc_alloc_init(NSPPrivacyProxyProxiedContentMap);
        objc_msgSend((id)a1, "addProxiedContentMaps:", v36);
        if (PBReaderPlaceMark() && (NSPPrivacyProxyProxiedContentMapReadFrom((uint64_t)v36, a2) & 1) != 0)
        {
LABEL_83:
          PBReaderRecallMark();
LABEL_84:

LABEL_108:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_110:

        return 0;
      case 0x12u:
        PBReaderReadString();
        v36 = (NSPPrivacyProxyAuthenticationInfo *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend((id)a1, "addTrustedNetworkDiscoveredProxies:", v36);
        goto LABEL_84;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_108;
    }
  }
}

uint64_t NSPPrivacyProxyTokenAttesterReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  NSPPrivacyProxyTokenIssuer *v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = objc_alloc_init(NSPPrivacyProxyTokenIssuer);
        objc_msgSend((id)a1, "addAssociatedIssuers:", v24);
        if (!PBReaderPlaceMark() || !NSPPrivacyProxyTokenIssuerReadFrom((char *)v24, a2))
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v25;

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTransparencyOHTTPEntryReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  NSPPrivacyProxyObliviousTargetInfo *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_40;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_42;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_42:
        v32 = 2;
        goto LABEL_47;
      case 2u:
        v24 = 0;
        v25 = 0;
        v19 = 0;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              v14 = v25++ >= 9;
              if (v14)
              {
                v19 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_46:
        v32 = 1;
LABEL_47:
        a1[v32] = v19;
        goto LABEL_48;
      case 3u:
        v29 = objc_alloc_init(NSPPrivacyProxyObliviousTargetInfo);
        objc_msgSend(a1, "addTargetInformation:", v29);
        if (PBReaderPlaceMark() && (NSPPrivacyProxyObliviousTargetInfoReadFrom(v29, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 4u:
        PBReaderReadData();
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)a1[3];
        a1[3] = v30;

        goto LABEL_48;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

__int128 *np_tunnel_protocol_get_id()
{
  if (_MergedGlobals_35 != -1)
    dispatch_once(&_MergedGlobals_35, &__block_literal_global_10);
  return &xmmword_1ED062A80;
}

void __np_tunnel_protocol_get_id_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  *(_OWORD *)algn_1ED062B78 = 0u;
  unk_1ED062B68 = 0u;
  unk_1ED062B58 = 0u;
  unk_1ED062B48 = 0u;
  unk_1ED062B38 = 0u;
  *(_OWORD *)&qword_1ED062B28 = 0u;
  *(_OWORD *)&qword_1ED062B18 = 0u;
  xmmword_1ED062B08 = 0u;
  unk_1ED062AF8 = 0u;
  unk_1ED062AE8 = 0u;
  unk_1ED062AD8 = 0u;
  unk_1ED062AC8 = 0u;
  *(_OWORD *)algn_1ED062AB8 = 0u;
  xmmword_1ED062B98 = 0u;
  unk_1ED062BA8 = 0u;
  xmmword_1ED062B88 = 0u;
  xmmword_1ED062AA8 = 0u;
  qword_1ED062AA0 = 0;
  xmmword_1ED062A80 = 0u;
  *(_OWORD *)algn_1ED062A90 = 0u;
  __strlcpy_chk();
  qword_1ED062AA0 = 0x200000004;
  nw_protocol_set_default_one_to_one_callbacks();
  *(_QWORD *)&xmmword_1ED062AA8 = np_tunnel_add_input_handler;
  *((_QWORD *)&xmmword_1ED062AA8 + 1) = np_tunnel_remove_input_handler;
  qword_1ED062AD0 = (uint64_t)np_tunnel_connected;
  unk_1ED062AD8 = np_tunnel_disconnected;
  qword_1ED062AE0 = (uint64_t)np_tunnel_error;
  unk_1ED062AE8 = np_tunnel_input_available;
  qword_1ED062B28 = (uint64_t)np_tunnel_get_local_endpoint;
  unk_1ED062B30 = np_tunnel_get_remote_endpoint;
  qword_1ED062B70 = (uint64_t)np_tunnel_get_output_local_endpoint;
  qword_1ED062B18 = (uint64_t)np_tunnel_get_parameters;
  unk_1ED062B20 = np_tunnel_get_path;
  qword_1ED062B50 = (uint64_t)np_tunnel_updated_path;
  unk_1ED062B58 = np_tunnel_supports_external_data;
  qword_1ED062AC0 = (uint64_t)np_flow_connect;
  unk_1ED062AC8 = np_flow_disconnect;
  qword_1ED062AF0 = (uint64_t)np_tunnel_output_available;
  unk_1ED062AF8 = np_flow_get_input_frames;
  qword_1ED062B00 = (uint64_t)np_flow_get_output_frames;
  *(_QWORD *)&xmmword_1ED062B08 = np_tunnel_finalize_output_frames;
  qword_1ED062B80 = (uint64_t)np_flow_waiting_for_output;
  qword_1ED062B60 = (uint64_t)np_tunnel_input_finished;
  unk_1ED062B68 = np_flow_output_finished;
  if ((nw_protocol_register_many_to_one() & 1) == 0)
  {
    nplog_obj();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E8FE000, v0, OS_LOG_TYPE_ERROR, "Failed to register the np_tunnel protocol", buf, 2u);
    }

  }
  if ((nw_protocol_register_parameter_modifier() & 1) == 0)
  {
    nplog_obj();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v2 = 0;
      _os_log_error_impl(&dword_19E8FE000, v1, OS_LOG_TYPE_ERROR, "Failed to register parameter modifier function", v2, 2u);
    }

  }
}

BOOL np_tunnel_add_input_handler(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "timestamps");
    if (v6)
      v7 = g_recordTimestamps == 0;
    else
      v7 = 1;
    if (!v7 && !*(_QWORD *)(v6 + 40))
      *(_QWORD *)(v6 + 40) = mach_absolute_time();
    *(_QWORD *)(a2 + 32) = objc_msgSend(v5, "protocol");
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "instantiateFlowWithTunnel:inputProtocol:", v5, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = v9;
      *(_QWORD *)(a2 + 56) = v10;
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 120))(a2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPath:", v12);

      }
      if (uuid_is_null((const unsigned __int8 *)objc_msgSend(v5, "protocol")))
        uuid_copy((unsigned __int8 *)objc_msgSend(v5, "protocol"), (const unsigned __int8 *)a2);
      objc_msgSend(v5, "localEndpoint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 128))(a2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setLocalEndpoint:", v14);

      }
      if (objc_msgSend(v5, "addNewFlow:", v10))
      {
        v15 = objc_msgSend(v5, "timestamps");
        v16 = 1;
        if (!v15)
          goto LABEL_28;
        if (!g_recordTimestamps)
          goto LABEL_28;
        v17 = (uint64_t *)(v15 + 48);
        if (*(_QWORD *)(v15 + 48))
          goto LABEL_28;
        goto LABEL_27;
      }
    }
    else
    {
      v19 = objc_msgSend(v5, "timestamps");
      v16 = 0;
      if (!v19 || !g_recordTimestamps)
        goto LABEL_28;
      v17 = (uint64_t *)(v19 + 48);
      if (!*(_QWORD *)(v19 + 48))
      {
LABEL_27:
        *v17 = mach_absolute_time();
        v16 = v9 != 0;
        goto LABEL_28;
      }
    }
    v16 = 0;
LABEL_28:

    goto LABEL_29;
  }
  nplog_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v21 = *(_QWORD *)(a1 + 16);
    v22 = 136315138;
    v23 = v21;
    _os_log_error_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_ERROR, "No tunnel found for protocol %s", (uint8_t *)&v22, 0xCu);
  }

  v16 = 0;
LABEL_29:

  return v16;
}

uint64_t np_tunnel_remove_input_handler(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a2 + 56);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v3, "dropInputProtocol");
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  objc_msgSend(v4, "removeFlow:", objc_msgSend(v3, "identifier"));

  return 1;
}

void np_tunnel_connected(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = *(id *)(a1 + 40);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 24) + 216))(a2, a1))
  {
    objc_msgSend(v4, "writeInitialData");
  }
  else
  {
    objc_msgSend(v4, "setConnectionState:", 3);
    objc_msgSend(v4, "handleConnected");
  }

}

void np_tunnel_disconnected(uint64_t a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 40);
  if ((objc_msgSend(v1, "handledDisconnected") & 1) != 0)
  {
    nplog_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v1, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_19E8FE000, v2, OS_LOG_TYPE_INFO, "%@: Ignoring extra disconnected callback", (uint8_t *)&v4, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v1, "setHandledDisconnected:", 1);
    if (objc_msgSend(v1, "connectionState") != 5)
      objc_msgSend(v1, "setConnectionState:", 1);
    objc_msgSend(v1, "handleConnectionIsDisconnected");
  }

}

void np_tunnel_error(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setError:");
  np_tunnel_disconnected(a1);
}

uint64_t np_tunnel_input_finished(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "setEof:", 1);
}

uint64_t np_tunnel_input_available(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "handleInputAvailable");
}

uint64_t np_tunnel_output_available(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "handleOutputAvailable");
}

uint64_t np_tunnel_finalize_output_frames()
{
  nw_frame_array_foreach();
  return 1;
}

uint64_t np_tunnel_get_remote_endpoint(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "endpoint");
}

uint64_t np_tunnel_get_local_endpoint(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "localEndpoint");
}

id np_tunnel_get_output_local_endpoint(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void (*v3)(void);
  void *v4;

  v1 = *(id *)(a1 + 40);
  v2 = *(_QWORD *)(objc_msgSend(v1, "protocol") + 32);
  if (!v2
    || (v3 = *(void (**)(void))(*(_QWORD *)(v2 + 24) + 200)) == 0
    || (v3(), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v1, "localEndpoint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t np_tunnel_get_parameters(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "parameters");
}

uint64_t np_tunnel_get_path(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "path");
}

uint64_t np_tunnel_supports_external_data()
{
  return 1;
}

uint64_t np_tunnel_updated_path(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 24) + 168))();
  else
    return 1;
}

uint64_t np_flow_connect(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  v2 = *(id *)(a2 + 56);
  objc_msgSend(v2, "tunnel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timestamps");
  if (v4)
    v5 = g_recordTimestamps == 0;
  else
    v5 = 1;
  if (!v5 && !*(_QWORD *)(v4 + 56))
    *(_QWORD *)(v4 + 56) = mach_absolute_time();

  v6 = objc_msgSend(v2, "connect");
  return v6;
}

void np_flow_disconnect(uint64_t a1, uint64_t a2)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(id *)(a2 + 56);
  nplog_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "hashKey");
    _os_log_impl(&dword_19E8FE000, v5, OS_LOG_TYPE_DEFAULT, "Flow %llu is disconnecting", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 + 24) + 48))(a2, a1);
  objc_msgSend(v4, "disconnect");

}

uint64_t np_flow_get_input_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = *(id *)(a2 + 56);
  kdebug_trace();
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134217984;
    v15 = objc_msgSend(v10, "hashKey");
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Flow %llu creating input frames", (uint8_t *)&v14, 0xCu);
  }

  v12 = objc_msgSend(v10, "addInputFramesToArray:limitMinimumBytes:limitMaximumBytes:limitMaximumFrames:", a6, a3, a4, a5);
  return v12;
}

uint64_t np_flow_get_output_frames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v10 = *(id *)(a2 + 56);
  kdebug_trace();
  nplog_obj();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v14 = 134218240;
    v15 = objc_msgSend(v10, "hashKey");
    v16 = 1024;
    v17 = a4;
    _os_log_debug_impl(&dword_19E8FE000, v11, OS_LOG_TYPE_DEBUG, "Flow %llu creating output frames for %u bytes", (uint8_t *)&v14, 0x12u);
  }

  v12 = objc_msgSend(v10, "addOutputFramesToArray:limitMinimumBytes:limitMaximumBytes:limitMaximumFrames:", a6, a3, a4, a5);
  return v12;
}

uint64_t np_flow_waiting_for_output(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 56), "waitingForOutput");
}

void *np_tunnel_protocol_create(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a2;
  v5 = a3;
  kdebug_trace();
  if (_MergedGlobals_35 != -1)
    dispatch_once(&_MergedGlobals_35, &__block_literal_global_10);
  if (nw_protocols_are_equal())
  {
    +[NSPManager sharedManager](NSPManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "instantiateTunnelWithEndpoint:parameters:", v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = v7;
      *(_QWORD *)(objc_msgSend(v8, "protocol") + 40) = v8;
      v7 = (void *)objc_msgSend(v8, "protocol");

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t np_tunnel_protocol_should_accept_new_flow(uint64_t a1)
{
  id v1;
  unint64_t v2;
  NSObject *v3;
  uint64_t v5;
  int v7;
  unint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *(id *)(a1 + 40);
  v2 = objc_msgSend(v1, "connectionState");
  nplog_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218240;
    v8 = v2;
    v9 = 1024;
    v10 = objc_msgSend(v1, "isCancelled");
    _os_log_debug_impl(&dword_19E8FE000, v3, OS_LOG_TYPE_DEBUG, "Existing tunnel state is %ld, isCancelled = %d", (uint8_t *)&v7, 0x12u);
  }

  if (v2 > 4 || v2 == 1)
    v5 = 0;
  else
    v5 = objc_msgSend(v1, "isCancelled") ^ 1;

  return v5;
}

uint64_t np_tunnel_protocol_modify_parameters(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3 || !v4)
  {
    nplog_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 134218240;
      v11 = v3;
      v12 = 2048;
      v13 = v5;
      _os_log_error_impl(&dword_19E8FE000, v7, OS_LOG_TYPE_ERROR, "Endpoint (%p) or parameters (%p) is nil, cannot modify parameters", (uint8_t *)&v10, 0x16u);
    }
    goto LABEL_8;
  }
  +[NSPManager sharedManager](NSPManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createTransformsForEndpoint:parameters:", v3, v5);
  v7 = objc_claimAutoreleasedReturnValue();

  if (!v7 || !nw_array_get_count())
  {
LABEL_8:

    v8 = 0;
    goto LABEL_9;
  }
  nw_parameters_set_transform_array();

  v8 = 1;
LABEL_9:

  return v8;
}

void sub_19E95D99C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __np_tunnel_finalize_output_frames_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  nw_frame_array_remove();
  nw_frame_finalize();

  return 1;
}

void sub_19E95EC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_19E9605A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_19E96319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E964FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E9670C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__610(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AEA9EC](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__611(uint64_t a1)
{

}

void sub_19E96C124(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_19E96EB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_19E9703E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E970608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E973080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_19E9757C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  uint64_t v47;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose((const void *)(v47 - 256), 8);
  _Block_object_dispose((const void *)(v47 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_19E9765F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  _Unwind_Resume(exception_object);
}

void sub_19E976938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E9772D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E9786D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t hchacha(unint64_t result, int *a2, int *a3, unint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;

  v4 = 2036477234;
  v5 = 1797285236;
  v6 = 1634760805;
  v7 = 857760878;
  v9 = *a2;
  v8 = a2[1];
  v11 = a2[2];
  v10 = a2[3];
  if (a4)
  {
    v12 = 0;
    v14 = *(_DWORD *)(result + 24);
    v13 = *(_DWORD *)(result + 28);
    v15 = *(_DWORD *)(result + 16);
    v16 = *(_DWORD *)(result + 20);
    v17 = *(_DWORD *)(result + 8);
    v18 = *(_DWORD *)(result + 12);
    v20 = result;
    LODWORD(result) = *(_DWORD *)result;
    v19 = *(_DWORD *)(v20 + 4);
    do
    {
      v21 = result + v6;
      v22 = v9 ^ v21;
      HIDWORD(v23) = v22;
      LODWORD(v23) = v22;
      v24 = (v23 >> 16) + v15;
      v25 = v24 ^ result;
      HIDWORD(v23) = v25;
      LODWORD(v23) = v25;
      v26 = (v23 >> 20) + v21;
      LODWORD(v23) = v26 ^ __ROR4__(v22, 16);
      v27 = v23;
      HIDWORD(v23) = v23;
      v28 = (v23 >> 24) + v24;
      LODWORD(v23) = v28 ^ __ROR4__(v25, 20);
      v29 = v23;
      HIDWORD(v23) = v23;
      v30 = v23 >> 25;
      v31 = v19 + v7;
      v32 = v8 ^ v31;
      HIDWORD(v23) = v32;
      LODWORD(v23) = v32;
      v33 = (v23 >> 16) + v16;
      v34 = v33 ^ v19;
      HIDWORD(v23) = v34;
      LODWORD(v23) = v34;
      v35 = (v23 >> 20) + v31;
      LODWORD(v23) = v35 ^ __ROR4__(v32, 16);
      v36 = v23;
      HIDWORD(v23) = v23;
      v37 = (v23 >> 24) + v33;
      LODWORD(v23) = v37 ^ __ROR4__(v34, 20);
      v38 = v23;
      HIDWORD(v23) = v23;
      v39 = v23 >> 25;
      v40 = v17 + v4;
      v41 = v11 ^ v40;
      HIDWORD(v23) = v41;
      LODWORD(v23) = v41;
      v42 = (v23 >> 16) + v14;
      v43 = v42 ^ v17;
      HIDWORD(v23) = v43;
      LODWORD(v23) = v43;
      v44 = (v23 >> 20) + v40;
      LODWORD(v23) = v44 ^ __ROR4__(v41, 16);
      v45 = v23;
      HIDWORD(v23) = v23;
      v46 = (v23 >> 24) + v42;
      LODWORD(v23) = v46 ^ __ROR4__(v43, 20);
      v47 = v23;
      HIDWORD(v23) = v23;
      v48 = v23 >> 25;
      v49 = v18 + v5;
      v50 = v10 ^ v49;
      HIDWORD(v23) = v50;
      LODWORD(v23) = v50;
      v51 = (v23 >> 16) + v13;
      v52 = v51 ^ v18;
      HIDWORD(v23) = v52;
      LODWORD(v23) = v52;
      v53 = (v23 >> 20) + v49;
      LODWORD(v23) = v53 ^ __ROR4__(v50, 16);
      v54 = v23;
      HIDWORD(v23) = v23;
      v55 = (v23 >> 24) + v51;
      LODWORD(v23) = v55 ^ __ROR4__(v52, 20);
      v56 = v23;
      HIDWORD(v23) = v23;
      v57 = v23 >> 25;
      v58 = v39 + v26;
      LODWORD(v23) = v58 ^ __ROR4__(v54, 24);
      v59 = v23;
      HIDWORD(v23) = v23;
      v60 = (v23 >> 16) + v46;
      LODWORD(v23) = v60 ^ __ROR4__(v38, 25);
      v61 = v23;
      HIDWORD(v23) = v23;
      v6 = (v23 >> 20) + v58;
      LODWORD(v23) = v6 ^ __ROR4__(v59, 16);
      HIDWORD(v23) = v23;
      v10 = v23 >> 24;
      v14 = v10 + v60;
      LODWORD(v23) = v14 ^ __ROR4__(v61, 20);
      HIDWORD(v23) = v23;
      v19 = v23 >> 25;
      v62 = v48 + v35;
      LODWORD(v23) = v62 ^ __ROR4__(v27, 24);
      v63 = v23;
      HIDWORD(v23) = v23;
      v64 = (v23 >> 16) + v55;
      LODWORD(v23) = v64 ^ __ROR4__(v47, 25);
      v65 = v23;
      HIDWORD(v23) = v23;
      v7 = (v23 >> 20) + v62;
      LODWORD(v23) = v7 ^ __ROR4__(v63, 16);
      HIDWORD(v23) = v23;
      v9 = v23 >> 24;
      v13 = v9 + v64;
      LODWORD(v23) = v13 ^ __ROR4__(v65, 20);
      HIDWORD(v23) = v23;
      v17 = v23 >> 25;
      v66 = v57 + v44;
      LODWORD(v23) = v66 ^ __ROR4__(v36, 24);
      v67 = v23;
      HIDWORD(v23) = v23;
      v68 = (v23 >> 16) + v28;
      LODWORD(v23) = v68 ^ __ROR4__(v56, 25);
      v69 = v23;
      HIDWORD(v23) = v23;
      v4 = (v23 >> 20) + v66;
      LODWORD(v23) = v4 ^ __ROR4__(v67, 16);
      HIDWORD(v23) = v23;
      v8 = v23 >> 24;
      v15 = v8 + v68;
      LODWORD(v23) = v15 ^ __ROR4__(v69, 20);
      HIDWORD(v23) = v23;
      v18 = v23 >> 25;
      v70 = v30 + v53;
      LODWORD(v23) = v70 ^ __ROR4__(v45, 24);
      v71 = v23;
      HIDWORD(v23) = v23;
      v72 = (v23 >> 16) + v37;
      LODWORD(v23) = v72 ^ __ROR4__(v29, 25);
      v73 = v23;
      HIDWORD(v23) = v23;
      v5 = (v23 >> 20) + v70;
      LODWORD(v23) = v5 ^ __ROR4__(v71, 16);
      HIDWORD(v23) = v23;
      v11 = v23 >> 24;
      v16 = v11 + v72;
      v12 += 2;
      LODWORD(v23) = v16 ^ __ROR4__(v73, 20);
      HIDWORD(v23) = v23;
      result = (v23 >> 25);
    }
    while (v12 < a4);
  }
  *a3 = v6;
  a3[1] = v7;
  a3[2] = v4;
  a3[3] = v5;
  a3[4] = v9;
  a3[5] = v8;
  a3[6] = v11;
  a3[7] = v10;
  return result;
}

uint64_t NSPPrivacyProxyPolicyTierMapReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  NSPPrivacyProxyPolicy *v23;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = objc_alloc_init(NSPPrivacyProxyPolicy);
        objc_storeStrong((id *)(a1 + 8), v23);
        if (!PBReaderPlaceMark() || (NSPPrivacyProxyPolicyReadFrom((uint64_t)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_33;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_35;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_35:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyPolicyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v6;
  char v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  BOOL v13;
  int v14;
  int v15;
  uint64_t result;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v6 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      while (1)
      {
        v10 = *v3;
        v11 = *(_QWORD *)(a2 + v10);
        if (v11 == -1 || v11 >= *(_QWORD *)(a2 + *v4))
          break;
        v12 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v11);
        *(_QWORD *)(a2 + v10) = v11 + 1;
        v9 |= (unint64_t)(v12 & 0x7F) << v7;
        if ((v12 & 0x80) == 0)
          goto LABEL_12;
        v7 += 7;
        v13 = v8++ >= 9;
        if (v13)
        {
          v9 = 0;
          v14 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v14 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v9 = 0;
LABEL_14:
      v15 = v9 & 7;
      if (v14 || v15 == 4)
        break;
      if ((v9 >> 3) == 1)
      {
        if (v15 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if (v23 < 0)
              {
                v18 += 7;
                v13 = v19++ >= 9;
                if (!v13)
                  continue;
              }
              goto LABEL_31;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 0;
          while (1)
          {
            v27 = *v3;
            v28 = *(_QWORD *)(a2 + v27);
            if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
              break;
            v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v6) + v28);
            *(_QWORD *)(a2 + v27) = v28 + 1;
            v26 |= (unint64_t)(v29 & 0x7F) << v24;
            if (v29 < 0)
            {
              v24 += 7;
              v13 = v25++ >= 9;
              if (!v13)
                continue;
            }
            goto LABEL_43;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
          PBRepeatedInt32Add();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t NSPPrivacyProxyTransparencyTokenEntryReadFrom(_QWORD *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  NSPPrivacyProxyTokenKey *v31;
  uint64_t v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_40;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_42;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_40:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_42:
        v32 = 2;
        goto LABEL_47;
      case 2u:
        v24 = 0;
        v25 = 0;
        v19 = 0;
        while (2)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
            *(_QWORD *)(a2 + v26) = v27 + 1;
            v19 |= (unint64_t)(v28 & 0x7F) << v24;
            if (v28 < 0)
            {
              v24 += 7;
              v14 = v25++ >= 9;
              if (v14)
              {
                v19 = 0;
                goto LABEL_46;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_46:
        v32 = 1;
LABEL_47:
        a1[v32] = v19;
        goto LABEL_48;
      case 3u:
        PBReaderReadString();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = (void *)a1[3];
        a1[3] = v29;

        goto LABEL_48;
      case 4u:
        v31 = objc_alloc_init(NSPPrivacyProxyTokenKey);
        objc_msgSend(a1, "addTokenKeys:", v31);
        if (PBReaderPlaceMark() && (NSPPrivacyProxyTokenKeyReadFrom((uint64_t)v31, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_48:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_48;
    }
  }
}

void sub_19E9832D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_19E98396C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19E983C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSPPrivacyProxyProxyPathWeightReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t result;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            while (1)
            {
              v28 = *v3;
              v29 = *(_QWORD *)(a2 + v28);
              if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
                break;
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_39;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
            PBRepeatedUInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v31 = 0;
          v32 = 0;
          v33 = 0;
          while (1)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
              break;
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
            *(_QWORD *)(a2 + v34) = v35 + 1;
            v33 |= (unint64_t)(v36 & 0x7F) << v31;
            if (v36 < 0)
            {
              v31 += 7;
              v14 = v32++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_55;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
          PBRepeatedUInt32Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_43;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_45:
        *(_DWORD *)(a1 + 32) = v20;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_19E987774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t NSPPrivacyProxyObliviousTargetInfoReadFrom(_BYTE *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  void *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;
  uint64_t v33;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_23;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
LABEL_23:
          v20 = *(void **)&a1[v18];
          *(_QWORD *)&a1[v18] = v17;

          continue;
        case 3u:
          v21 = 0;
          v22 = 0;
          v23 = 0;
          a1[44] |= 1u;
          while (2)
          {
            v24 = *v3;
            v25 = *(_QWORD *)(a2 + v24);
            if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (v14)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v23) = 0;
LABEL_44:
          v33 = 16;
          goto LABEL_49;
        case 4u:
          v27 = 0;
          v28 = 0;
          v23 = 0;
          a1[44] |= 2u;
          break;
        case 5u:
          PBReaderReadString();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            objc_msgSend(a1, "addProcesses:", v32);

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v23 |= (unint64_t)(v31 & 0x7F) << v27;
        if ((v31 & 0x80) == 0)
          goto LABEL_46;
        v27 += 7;
        v14 = v28++ >= 9;
        if (v14)
        {
          LODWORD(v23) = 0;
          goto LABEL_48;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_46:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v23) = 0;
LABEL_48:
      v33 = 40;
LABEL_49:
      *(_DWORD *)&a1[v33] = v23;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

uint64_t CFBundleCopyLocalizationForLocalizationInfo()
{
  return MEMORY[0x1E0C98038]();
}

uint64_t CFBundleGetLocalizationInfoForLocalization()
{
  return MEMORY[0x1E0C98140]();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x1E0C98248](calendar, v3, at);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFDataRef CFHTTPMessageCopySerializedMessage(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x1E0C92818](message);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x1E0C92868](message, headerField, value);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t CFURLRequestCopyHTTPRequest()
{
  return MEMORY[0x1E0C929B0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t NEHelperCacheCopyAppUUIDMapping()
{
  return MEMORY[0x1E0C804F8]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1E0D82BF8]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1E0D82C00]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x1E0D82DD8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x1E0D82DE0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x1E0D82DE8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x1E0D82DF0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x1E0D82DF8]();
}

uint64_t PBRepeatedInt32Set()
{
  return MEMORY[0x1E0D82E08]();
}

uint64_t PBRepeatedUInt32Add()
{
  return MEMORY[0x1E0D82E48]();
}

uint64_t PBRepeatedUInt32Clear()
{
  return MEMORY[0x1E0D82E50]();
}

uint64_t PBRepeatedUInt32Copy()
{
  return MEMORY[0x1E0D82E58]();
}

uint64_t PBRepeatedUInt32Hash()
{
  return MEMORY[0x1E0D82E60]();
}

uint64_t PBRepeatedUInt32IsEqual()
{
  return MEMORY[0x1E0D82E68]();
}

uint64_t PBRepeatedUInt32NSArray()
{
  return MEMORY[0x1E0D82E70]();
}

uint64_t PBRepeatedUInt32Set()
{
  return MEMORY[0x1E0D82E78]();
}

uint64_t SecCertificateCopySummaryProperties()
{
  return MEMORY[0x1E0CD6000]();
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateNotValidAfter()
{
  return MEMORY[0x1E0CD6070]();
}

uint64_t SecCertificateNotValidBefore()
{
  return MEMORY[0x1E0CD6078]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1E0CD63E8]();
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1E0CD6418](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1E0CD64B8]();
}

uint64_t SecPolicyCreateAppleSSLPinned()
{
  return MEMORY[0x1E0CD64C8]();
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6510](revocationFlags);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6520](server, hostname);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1E0CD65E0](task, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecKeyRef SecTrustCopyKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x1E0CD6670](trust);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6690](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66E8](trust, result);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1E0CD6748](trust, policies);
}

uint64_t SipHash()
{
  return MEMORY[0x1E0D1B658]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x1E0C9A390]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete()
{
  return off_1E4135778();
}

uint64_t operator new()
{
  return off_1E4135780();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C816F0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1E0C81CF0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t chacha20_all_64x64()
{
  return MEMORY[0x1E0D1B8A8]();
}

uint64_t chacha20_final()
{
  return MEMORY[0x1E0D1B8B0]();
}

uint64_t chacha20_init_64x64()
{
  return MEMORY[0x1E0D1B8B8]();
}

uint64_t chacha20_update()
{
  return MEMORY[0x1E0D1B918]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CC0](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD0](data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CD8](data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t freemptcpinfo()
{
  return MEMORY[0x1E0CCED38]();
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C83818](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1E0C83900](*(_QWORD *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1E0C83970](*(_QWORD *)&a1, a2, a3);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

int kevent(int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1E0C83A38](*(_QWORD *)&kq, changelist, *(_QWORD *)&nchanges, eventlist, *(_QWORD *)&nevents, timeout);
}

int listen(int a1, int a2)
{
  return MEMORY[0x1E0C83B80](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t nw_array_append()
{
  return MEMORY[0x1E0CCEE90]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x1E0CCEEA0]();
}

uint64_t nw_array_get_count()
{
  return MEMORY[0x1E0CCEEA8]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

uint64_t nw_connection_copy_metadata()
{
  return MEMORY[0x1E0CCF010]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF128](connection, *(_QWORD *)&minimum_incomplete_length, *(_QWORD *)&maximum_length, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1E0CCF188]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1E0CCF190]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

uint64_t nw_connection_write_multiple()
{
  return MEMORY[0x1E0CCF210]();
}

uint64_t nw_context_copy_implicit_context()
{
  return MEMORY[0x1E0CCF280]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF340](endpoint);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x1E0CCF370]();
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF378](endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

uint64_t nw_endpoint_get_description()
{
  return MEMORY[0x1E0CCF400]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF410](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF440](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1E0CCF468](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1E0CCF470](error);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x1E0CCF4D8]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x1E0CCF4E8]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1E0CCF4F0]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1E0CCF4F8]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1E0CCF508]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x1E0CCF510]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x1E0CCF520]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1E0CCF538]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1E0CCF540]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1E0CCF548]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1E0CCF558]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1E0CCF560]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x1E0CCF580]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x1E0CCF598]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1E0CCF5B0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1E0CCF5B8]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x1E0CCF5C0]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x1E0CCF5C8]();
}

uint64_t nw_interface_create_with_index()
{
  return MEMORY[0x1E0CCF6F0]();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF700](interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x1E0CCF710](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x1E0CCF728](interface);
}

uint64_t nw_nat64_copy_prefixes()
{
  return MEMORY[0x1E0CCF848]();
}

uint64_t nw_nat64_extract_v4()
{
  return MEMORY[0x1E0CCF860]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x1E0CCF8C0]();
}

uint64_t nw_parameters_copy_metadata()
{
  return MEMORY[0x1E0CCF8F0]();
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1E0CCF930]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1E0CCF958]();
}

uint64_t nw_parameters_get_account_id()
{
  return MEMORY[0x1E0CCF998]();
}

uint64_t nw_parameters_get_data_mode()
{
  return MEMORY[0x1E0CCF9A8]();
}

uint64_t nw_parameters_get_effective_bundle_id()
{
  return MEMORY[0x1E0CCF9B0]();
}

uint64_t nw_parameters_get_multipath()
{
  return MEMORY[0x1E0CCF9D8]();
}

nw_multipath_service_t nw_parameters_get_multipath_service(nw_parameters_t parameters)
{
  return MEMORY[0x1E0CCF9E0](parameters);
}

uint64_t nw_parameters_get_no_delay()
{
  return MEMORY[0x1E0CCF9E8]();
}

uint64_t nw_parameters_get_tfo()
{
  return MEMORY[0x1E0CCFA08]();
}

uint64_t nw_parameters_get_tfo_no_cookie()
{
  return MEMORY[0x1E0CCFA10]();
}

uint64_t nw_parameters_get_tls()
{
  return MEMORY[0x1E0CCFA18]();
}

uint64_t nw_parameters_has_initial_data_payload()
{
  return MEMORY[0x1E0CCFA28]();
}

uint64_t nw_parameters_set_account_id()
{
  return MEMORY[0x1E0CCFA50]();
}

uint64_t nw_parameters_set_context()
{
  return MEMORY[0x1E0CCFA90]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x1E0CCFA98]();
}

uint64_t nw_parameters_set_e_proc_uuid()
{
  return MEMORY[0x1E0CCFAB8]();
}

uint64_t nw_parameters_set_indefinite()
{
  return MEMORY[0x1E0CCFB10]();
}

uint64_t nw_parameters_set_metadata()
{
  return MEMORY[0x1E0CCFB40]();
}

uint64_t nw_parameters_set_no_delay()
{
  return MEMORY[0x1E0CCFB50]();
}

uint64_t nw_parameters_set_tfo()
{
  return MEMORY[0x1E0CCFC50]();
}

uint64_t nw_parameters_set_transform_array()
{
  return MEMORY[0x1E0CCFC70]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x1E0CCFCD0]();
}

uint64_t nw_path_get_mtu()
{
  return MEMORY[0x1E0CCFDA8]();
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return MEMORY[0x1E0CCFE00](path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return MEMORY[0x1E0CCFE08](path);
}

uint64_t nw_protocol_boringssl_identifier()
{
  return MEMORY[0x1E0DE40B8]();
}

uint64_t nw_protocol_register_extended()
{
  return MEMORY[0x1E0CCFF98]();
}

uint64_t nw_protocol_register_many_to_one()
{
  return MEMORY[0x1E0CCFFA0]();
}

uint64_t nw_protocol_register_parameter_modifier()
{
  return MEMORY[0x1E0CCFFA8]();
}

uint64_t nw_protocol_remove_instance()
{
  return MEMORY[0x1E0CCFFB0]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x1E0CCFFB8]();
}

uint64_t nw_protocol_transform_append_protocol()
{
  return MEMORY[0x1E0CD0008]();
}

uint64_t nw_protocol_transform_create()
{
  return MEMORY[0x1E0CD0010]();
}

uint64_t nw_protocol_transform_disable_protocol()
{
  return MEMORY[0x1E0CD0018]();
}

uint64_t nw_protocol_transform_replace_endpoint()
{
  return MEMORY[0x1E0CD0020]();
}

uint64_t nw_protocol_transform_set_fallback_mode()
{
  return MEMORY[0x1E0CD0028]();
}

uint64_t nw_protocol_transform_set_multipath_service()
{
  return MEMORY[0x1E0CD0030]();
}

uint64_t nw_protocol_transform_set_no_path_fallback()
{
  return MEMORY[0x1E0CD0038]();
}

uint64_t nw_protocol_transform_set_no_proxy()
{
  return MEMORY[0x1E0CD0040]();
}

uint64_t nw_protocol_transform_set_prohibit_direct()
{
  return MEMORY[0x1E0CD0048]();
}

uint64_t nw_protocol_transform_set_tfo()
{
  return MEMORY[0x1E0CD0050]();
}

uint64_t nw_protocol_transform_set_tfo_no_cookie()
{
  return MEMORY[0x1E0CD0058]();
}

uint64_t nw_protocols_are_equal()
{
  return MEMORY[0x1E0CD0060]();
}

uint64_t nw_queue_cancel_source()
{
  return MEMORY[0x1E0CD00F0]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x1E0CD00F8]();
}

uint64_t nw_queue_context_create_source()
{
  return MEMORY[0x1E0CD0108]();
}

uint64_t nw_queue_resume_source()
{
  return MEMORY[0x1E0CD0118]();
}

uint64_t nw_queue_set_timer_values()
{
  return MEMORY[0x1E0CD0120]();
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x1E0C84438]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x1E0C84440]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x1E0C84448]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x1E0C84458]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x1E0C84470]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t poly1305()
{
  return MEMORY[0x1E0D1B978]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1E0C853C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

