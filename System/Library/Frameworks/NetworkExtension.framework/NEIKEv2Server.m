@implementation NEIKEv2Server

- (void)dealloc
{
  objc_super v3;

  -[NEIKEv2Server stopRedirectTimer]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2Server;
  -[NEIKEv2Server dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectTimer, 0);
  objc_storeStrong((id *)&self->_pathProxyConnectedRemoteEndpointString, 0);
  objc_storeStrong((id *)&self->_pathProxyEndpoint, 0);
  objc_storeStrong((id *)&self->_additionalIPv6ServerAddresses, 0);
  objc_storeStrong((id *)&self->_additionalIPv4ServerAddresses, 0);
  objc_storeStrong((id *)&self->_redirectedFromAddress, 0);
  objc_storeStrong((id *)&self->_resolvedAddressList, 0);
  objc_storeStrong((id *)&self->_serverAddress, 0);
}

- (void)stopRedirectTimer
{
  NSObject *v2;
  NSObject *v3;
  NSObject *source;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 72);
    if (v2)
    {
      source = v2;
      if (dispatch_source_testcancel(v2))
      {
        v3 = source;
      }
      else
      {
        dispatch_source_cancel(source);
        v3 = *(NSObject **)(a1 + 72);
      }
      *(_QWORD *)(a1 + 72) = 0;

    }
  }
}

- (void)setServerResolvedAddress:(void *)a3 path:
{
  id v5;
  const char *v6;
  __CFString *v7;
  const char *v8;
  NEIKEv2AddressList *v9;
  SEL v10;
  id Property;
  const __CFString *v12;
  NSObject *v13;
  unsigned int v14;
  const char *v15;
  ptrdiff_t v16;
  const char *v17;
  const char *v18;
  id v19;
  void *v20;
  void *v21;
  ptrdiff_t v22;
  NSObject *v23;
  unsigned int v24;
  NSObject *v25;
  int v26;
  _DWORD v27[7];

  *(_QWORD *)&v27[5] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v7 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]((uint64_t)NEIKEv2AddressList, v5, a3);
    if (!v7)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        v26 = 136315138;
        *(_QWORD *)v27 = "-[NEIKEv2Server setServerResolvedAddress:path:]";
        _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "%s called with null normalizedAddress", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_20;
    }
    if (!objc_getProperty(a1, v6, 24, 1))
    {
      v9 = objc_alloc_init(NEIKEv2AddressList);
      objc_setProperty_atomic(a1, v10, v9, 24);

    }
    Property = objc_getProperty(a1, v8, 24, 1);
    v12 = (const __CFString *)v5;
    v13 = v12;
    if (!Property)
    {
LABEL_20:

      goto LABEL_21;
    }
    if (!v12)
    {
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        v26 = 136315138;
        *(_QWORD *)v27 = "-[NEIKEv2AddressList addAddressToList:]";
        _os_log_fault_impl(&dword_19BD16000, v23, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_19;
    }
    v14 = NEGetAddressFamilyFromString(v12);
    if (v14 == 30)
    {
      v16 = 8;
      if (objc_getProperty(Property, v15, 8, 1))
        goto LABEL_14;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 8;
      v20 = Property;
      v21 = v19;
      v22 = 8;
    }
    else
    {
      if (v14 != 2)
      {
        v24 = v14;
        ne_log_obj();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = 67109378;
          v27[0] = v24;
          LOWORD(v27[1]) = 2112;
          *(_QWORD *)((char *)&v27[1] + 2) = v13;
          _os_log_error_impl(&dword_19BD16000, v25, OS_LOG_TYPE_ERROR, "Bad address family %d for address %@", (uint8_t *)&v26, 0x12u);
        }

        v23 = 0;
        goto LABEL_19;
      }
      v16 = 16;
      if (objc_getProperty(Property, v15, 16, 1))
      {
LABEL_14:
        v23 = objc_getProperty(Property, v17, v16, 1);
        if ((-[NSObject containsObject:](v23, "containsObject:", v13) & 1) == 0)
          -[NSObject addObject:](v23, "addObject:", v13);
LABEL_19:

        goto LABEL_20;
      }
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 16;
      v20 = Property;
      v21 = v19;
      v22 = 16;
    }
    objc_setProperty_atomic(v20, v18, v21, v22);

    goto LABEL_14;
  }
LABEL_21:

}

- (void)startRedirectTimer
{
  SEL v2;
  NSObject *v3;
  dispatch_time_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    -[NEIKEv2Server stopRedirectTimer]((uint64_t)a1);
    if (objc_getProperty(a1, v2, 32, 1))
    {
      ne_log_obj();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v9 = "-[NEIKEv2Server startRedirectTimer]";
        _os_log_error_impl(&dword_19BD16000, v3, OS_LOG_TYPE_ERROR, "%s: Starting timer\n", buf, 0xCu);
      }

      v4 = dispatch_time(0, 300000000000);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__NEIKEv2Server_startRedirectTimer__block_invoke;
      v7[3] = &unk_1E3CC41F0;
      v7[4] = a1;
      NERepeatingEventCreate(MEMORY[0x1E0C80D38], v4, 0, 300000, 150000, 0, v7, 0);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[9];
      a1[9] = v5;

    }
  }
}

void __35__NEIKEv2Server_startRedirectTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[NEIKEv2Server startRedirectTimer]_block_invoke";
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "%s: timeout\n", (uint8_t *)&v4, 0xCu);
  }

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    *(_DWORD *)(v3 + 12) = 0;
}

- (void)resetPathProxyState
{
  SEL v3;

  if (a1)
  {
    a1[8] = 0;
    objc_setProperty_atomic(a1, a2, 0, 56);
    objc_setProperty_atomic(a1, v3, 0, 64);
  }
}

- (id)getNextViableServerAddressForPath:(void *)a1
{
  id v3;
  SEL v4;
  _QWORD *Property;
  id v6;
  void *v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  unint64_t v13;
  const char *v14;
  const char *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  int v21;
  void *v22;
  NSObject *v23;
  __CFString *v24;
  SEL v25;
  const char *v27;
  const char *v28;
  _BYTE buf[12];
  __int16 v30;
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = a2;
    Property = objc_getProperty(a1, v4, 24, 1);
    v6 = v3;
    v7 = v6;
    if (Property)
    {
      if (objc_msgSend(v6, "supportsIPv6"))
      {
        v9 = Property[3];
        if (v9 < objc_msgSend(objc_getProperty(Property, v8, 8, 1), "count"))
        {
          objc_msgSend(objc_getProperty(Property, v10, 8, 1), "objectAtIndex:", Property[3]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ++Property[3];
LABEL_21:

          v24 = (__CFString *)+[NEIKEv2AddressList normalizeServerAddress:path:]((uint64_t)NEIKEv2AddressList, v11, v7);
          objc_setProperty_atomic(a1, v25, v24, 16);

          return v11;
        }
      }
      if (objc_msgSend(v7, "supportsIPv4"))
      {
        v13 = Property[4];
        if (v13 < objc_msgSend(objc_getProperty(Property, v12, 16, 1), "count"))
        {
          objc_msgSend(objc_getProperty(Property, v14, 16, 1), "objectAtIndex:", Property[4]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          ++Property[4];
          goto LABEL_21;
        }
      }
      if (objc_msgSend(v7, "supportsIPv6"))
      {
        v16 = Property[4];
        if (v16 < objc_msgSend(objc_getProperty(Property, v15, 16, 1), "count"))
        {
          *(_QWORD *)buf = 0;
          objc_msgSend(v7, "scopedInterface");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v7, "scopedInterface");
          else
            objc_msgSend(v7, "interface");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "interfaceIndex");

          v19 = nw_nat64_copy_prefixes();
          if (v19)
          {
            v21 = v19;
            objc_msgSend(objc_getProperty(Property, v20, 16, 1), "objectAtIndex:", Property[4]);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            ++Property[4];
            +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]((uint64_t)NEIKEv2AddressList, v22, *(uint64_t *)buf, v21);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (*(_QWORD *)buf)
              free(*(void **)buf);

            goto LABEL_21;
          }
        }
      }
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        if (objc_msgSend(v7, "supportsIPv4"))
          v27 = "yes";
        else
          v27 = "no";
        if (objc_msgSend(v7, "supportsIPv6"))
          v28 = "yes";
        else
          v28 = "no";
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = v27;
        v30 = 2080;
        v31 = v28;
        _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, "Failed to find suitable address, path supports IPv4 %s IPv6 %s", buf, 0x16u);
      }

    }
    v11 = 0;
    goto LABEL_21;
  }
  return 0;
}

- (id)getViableServerAddressForPath:(void *)a1
{
  const char *v3;
  id v4;
  const char *v5;
  id v6;
  id Property;
  const char *v8;
  id v9;
  const char *v10;
  const __CFString *v11;
  unsigned int v12;
  const char *v13;
  NSObject *v15;
  const char *v16;
  const char *v17;
  void *v18;
  ptrdiff_t v19;
  const char *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  int v25;
  id v26;
  uint8_t buf[8];

  v4 = a2;
  if (a1)
  {
    if (objc_getProperty(a1, v3, 56, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 56, 1), "hostname");
      v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
      a1 = v6;
      goto LABEL_15;
    }
    Property = objc_getProperty(a1, v5, 16, 1);
    if ((+[NEIKEv2Helper getIdentifierType:]((uint64_t)NEIKEv2Helper, Property) & 3) != 1)
      v9 = -[NEIKEv2Server getNextViableServerAddressForPath:](a1, v4);
    if (objc_getProperty(a1, v8, 16, 1))
    {
      v11 = (const __CFString *)objc_getProperty(a1, v10, 16, 1);
      v12 = NEGetAddressFamilyFromString(v11);
      if (objc_msgSend(v4, "supportsIPv4") && (objc_msgSend(v4, "supportsIPv6") & 1) != 0
        || objc_msgSend(v4, "supportsIPv4") && v12 == 2
        || objc_msgSend(v4, "supportsIPv6") && v12 == 30)
      {
        v6 = objc_getProperty(a1, v13, 16, 1);
        goto LABEL_14;
      }
      if (objc_msgSend(v4, "supportsIPv4") && objc_getProperty(a1, v16, 40, 1))
      {
        v18 = a1;
        v19 = 40;
LABEL_26:
        objc_msgSend(objc_getProperty(v18, v17, v19, 1), "objectAtIndexedSubscript:", 0);
        v6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      if (objc_msgSend(v4, "supportsIPv6"))
      {
        if (objc_getProperty(a1, v20, 48, 1))
        {
          v18 = a1;
          v19 = 48;
          goto LABEL_26;
        }
        *(_QWORD *)buf = 0;
        objc_msgSend(v4, "scopedInterface");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v4, "scopedInterface");
        else
          objc_msgSend(v4, "interface");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "interfaceIndex");

        v23 = nw_nat64_copy_prefixes();
        if (v23)
        {
          v25 = v23;
          v26 = objc_getProperty(a1, v24, 16, 1);
          +[NEIKEv2AddressList getSynthesizedIPv6Address:outgoingIf:nat64Prefixes:numNat64Prefixes:]((uint64_t)NEIKEv2AddressList, v26, *(uint64_t *)buf, v25);
          a1 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
      }
    }
    else
    {
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "failed to find viable server", buf, 2u);
      }

    }
    a1 = 0;
  }
LABEL_15:

  return a1;
}

@end
