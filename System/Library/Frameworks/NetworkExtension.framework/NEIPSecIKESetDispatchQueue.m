@implementation NEIPSecIKESetDispatchQueue

void __NEIPSecIKESetDispatchQueue_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  id v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "clientCallback"))
    goto LABEL_18;
  if ((unint64_t)(a2 - 1) > 3)
  {
    v7 = 0;
    if (v5)
      goto LABEL_4;
  }
  else
  {
    v7 = dword_19BED7580[a2 - 1];
    if (v5)
    {
LABEL_4:
      v8 = 70001;
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", CFSTR("NEIKEv2ErrorDomain"));

      if (v11)
      {
        v12 = objc_msgSend(v5, "code");
        if ((unint64_t)(v12 - 2) < 0xD)
          v8 = dword_19BED7190[v12 - 2];
      }
      else
      {
        objc_msgSend(v5, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", CFSTR("NEIKEv2ProtocolErrorDomain"));

        if (v14)
        {
          if (objc_msgSend(v5, "code") < 0x2000
            || objc_msgSend(v5, "code") >= 0x4000
            || objc_msgSend(WeakRetained, "peerAuthenticated"))
          {
            v8 = objc_msgSend(v5, "code");
          }
          else
          {
            v8 = 70039;
          }
        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("NotifyCode"));

      goto LABEL_15;
    }
  }
  v9 = 0;
LABEL_15:
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17[0] = 67109378;
    v17[1] = v7;
    v18 = 2112;
    v19 = v9;
    _os_log_debug_impl(&dword_19BD16000, v16, OS_LOG_TYPE_DEBUG, "Updating IKE status %u, %@", (uint8_t *)v17, 0x12u);
  }

  ((void (*)(id, _QWORD, _QWORD, id, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, 0, v7 | 0x1100u, v9, objc_msgSend(WeakRetained, "clientCallbackInfo"));
LABEL_18:

}

void __NEIPSecIKESetDispatchQueue_block_invoke_132(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id WeakRetained;
  int v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "clientCallback"))
    goto LABEL_16;
  if ((unint64_t)(a3 - 1) > 3)
  {
    v9 = 0;
    if (v7)
    {
LABEL_4:
      v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqual:", CFSTR("NEIKEv2ErrorDomain"));

      if (v12)
      {
        v13 = objc_msgSend(v7, "code");
        if ((unint64_t)(v13 - 2) < 0xD)
        {
          v14 = dword_19BED7190[v13 - 2];
LABEL_12:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("NotifyCode"));

          goto LABEL_13;
        }
      }
      else
      {
        objc_msgSend(v7, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", CFSTR("NEIKEv2ProtocolErrorDomain"));

        if (v16)
        {
          v14 = objc_msgSend(v7, "code");
          goto LABEL_12;
        }
      }
      v14 = 70001;
      goto LABEL_12;
    }
  }
  else
  {
    v9 = dword_19BED7580[a3 - 1];
    if (v7)
      goto LABEL_4;
  }
  v10 = 0;
LABEL_13:
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19[0] = 67109634;
    v19[1] = a2;
    v20 = 1024;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "Updating Child %u status %u, %@", (uint8_t *)v19, 0x18u);
  }

  ((void (*)(id, uint64_t, _QWORD, id, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, a2, v9 | 0x1100u, v10, objc_msgSend(WeakRetained, "clientCallbackInfo"));
LABEL_16:

}

void __NEIPSecIKESetDispatchQueue_block_invoke_134(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  const char *v5;
  id v6;
  id Property;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!objc_msgSend(WeakRetained, "clientCallback"))
    goto LABEL_30;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v25 = WeakRetained;
  v26 = v3;
  if (v3)
    Property = objc_getProperty(v3, v5, 16, 1);
  else
    Property = 0;
  v8 = Property;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v9)
    goto LABEL_27;
  v10 = v9;
  v11 = *(_QWORD *)v28;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v13, "attributeName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("Name"));

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
LABEL_11:
        objc_msgSend(v13, "address", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hostname");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v14;
        v19 = v17;
        v20 = CFSTR("Address");
LABEL_12:
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v20);

LABEL_13:
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
LABEL_17:
        objc_msgSend(v13, "address", v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hostname");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, CFSTR("Address"));

        objc_msgSend(v13, "subnetMaskAddress");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "hostname");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v14;
        v19 = v17;
        v20 = CFSTR("Netmask");
        goto LABEL_12;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "stringValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("String"));
        goto LABEL_13;
      }
LABEL_14:
      objc_msgSend(v6, "addObject:", v14, v25);

      ++v12;
    }
    while (v10 != v12);
    v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    v10 = v23;
  }
  while (v23);
LABEL_27:

  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "Updating configuration with %@", buf, 0xCu);
  }

  WeakRetained = v25;
  ((void (*)(void *, _QWORD, uint64_t, id, uint64_t))objc_msgSend(v25, "clientCallback"))(v25, 0, 4608, v6, objc_msgSend(v25, "clientCallbackInfo"));

  v3 = v26;
LABEL_30:

}

void __NEIPSecIKESetDispatchQueue_block_invoke_155(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  id v48;
  id obj;
  id obja;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "clientCallback"))
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v47 = v8;
    v48 = v7;
    v46 = v10;
    if (v7)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = v7;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v56 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v18 = -[NEIKEv2TrafficSelector type]((uint64_t)v16);
            v19 = CFSTR("IPv4");
            if (v18 == 7 || (v20 = -[NEIKEv2TrafficSelector type]((uint64_t)v16), v19 = CFSTR("IPv6"), v20 == 8))
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("TSType"), v46);
            objc_msgSend(v16, "startAddress", v19, v46);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hostname");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("TSStartAddress"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v16, "startPort"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("TSStartPort"));

            objc_msgSend(v16, "endAddress");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "hostname");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("TSEndAddress"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v16, "endPort"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("TSEndPort"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v16, "ipProtocol"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("TSProtocol"));

            objc_msgSend(v11, "addObject:", v17);
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        }
        while (v13);
      }

      v10 = v46;
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v11, CFSTR("TrafficSelectorsLocal"));

      v8 = v47;
      v7 = v48;
      a2 = a2;
    }
    if (v8)
    {
      v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obja = v8;
      v29 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v52;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v52 != v31)
              objc_enumerationMutation(obja);
            v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
            v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v35 = -[NEIKEv2TrafficSelector type]((uint64_t)v33);
            v36 = CFSTR("IPv4");
            if (v35 == 7 || (v37 = -[NEIKEv2TrafficSelector type]((uint64_t)v33), v36 = CFSTR("IPv6"), v37 == 8))
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("TSType"), v46);
            objc_msgSend(v33, "startAddress", v36, v46);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "hostname");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v39, CFSTR("TSStartAddress"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v33, "startPort"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("TSStartPort"));

            objc_msgSend(v33, "endAddress");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "hostname");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v42, CFSTR("TSEndAddress"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v33, "endPort"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v43, CFSTR("TSEndPort"));

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v33, "ipProtocol"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v44, CFSTR("TSProtocol"));

            objc_msgSend(v28, "addObject:", v34);
          }
          v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        }
        while (v30);
      }

      v10 = v46;
      objc_msgSend(v46, "setObject:forKeyedSubscript:", v28, CFSTR("TrafficSelectorsRemote"));

      v8 = v47;
      v7 = v48;
      a2 = a2;
    }
    ne_log_obj();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v10;
      _os_log_debug_impl(&dword_19BD16000, v45, OS_LOG_TYPE_DEBUG, "Updating traffic selectors with %@", buf, 0xCu);
    }

    ((void (*)(id, uint64_t, uint64_t, id, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, a2, 4608, v10, objc_msgSend(WeakRetained, "clientCallbackInfo"));
  }

}

void __NEIPSecIKESetDispatchQueue_block_invoke_177(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "clientCallback"))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v3 = 0;
      _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "Firing short DPD event", v3, 2u);
    }

    ((void (*)(id, _QWORD, uint64_t, _QWORD, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, 0, 5888, 0, objc_msgSend(WeakRetained, "clientCallbackInfo"));
  }

}

void __NEIPSecIKESetDispatchQueue_block_invoke_179(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "clientCallback"))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "Firing redirect event", v9, 2u);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v3, "addressFamily") == 2)
      {
        v7 = CFSTR("RedirectedToServerTypeIPAddress");
      }
      else
      {
        if (objc_msgSend(v3, "addressFamily") != 30)
        {
LABEL_12:
          objc_msgSend(v3, "hostname");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("RedirectedToServer"));

          goto LABEL_13;
        }
        v7 = CFSTR("RedirectedToServerTypeIPv6Address");
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_13:
        ((void (*)(id, _QWORD, uint64_t, id, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, 0, 5120, v6, objc_msgSend(WeakRetained, "clientCallbackInfo"));

        goto LABEL_14;
      }
      v7 = CFSTR("RedirectToServerTypeFQDN");
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("RedirectedToServerType"));
    goto LABEL_12;
  }
LABEL_14:

}

void __NEIPSecIKESetDispatchQueue_block_invoke_193(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "clientCallback"))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "Firing private notify status event", buf, 2u);
    }

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v20 = v3;
      v19 = WeakRetained;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = v7;
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "notifyStatus") == 51115)
          {
            objc_msgSend(v15, "notifyData");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("N1ModeInformation"));

          }
          v17 = objc_msgSend(v15, "notifyStatus") == 10500;
          if (objc_msgSend(v15, "notifyStatus") == 41041)
          {
            objc_msgSend(v15, "notifyData");
            v18 = objc_claimAutoreleasedReturnValue();

            v11 = (void *)v18;
          }
          v10 |= v17;
        }
        v7 = v13;
        v9 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);

      WeakRetained = v19;
      if ((v10 & (v11 != 0)) == 1)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("NetworkFailureBackoffTimer"));
      v3 = v20;
    }
    else
    {

      v11 = 0;
    }
    if (objc_msgSend(v6, "count"))
      ((void (*)(id, _QWORD, uint64_t, id, uint64_t))objc_msgSend(WeakRetained, "clientCallback"))(WeakRetained, 0, 6144, v6, objc_msgSend(WeakRetained, "clientCallbackInfo"));

  }
}

@end
