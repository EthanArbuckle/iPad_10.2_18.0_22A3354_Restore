@implementation IDSInterfaceAddress

+ (id)interfaceAddressWithTransmittedBytes:(char *)a3 length:(int64_t)a4 withLocalInterfaceName:(id)a5
{
  uint64_t v7;
  id v8;
  __int128 v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  _OWORD *v18;
  unsigned int v19;
  unsigned int v20;
  const char *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  unsigned int v30;
  unsigned int v31;
  int v32;
  unint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  double v37;
  const char *v38;
  IDSInterfaceAddress *v39;
  const char *v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  uint8_t buf[4];
  unsigned int v47;
  __int16 v48;
  uint64_t v49;
  _OWORD v50[8];
  _OWORD v51[8];
  _OWORD v52[8];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v45 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43 = v9;
  v44 = v9;
  v42 = v9;
  v10 = 0.0;
  memset(v52, 0, sizeof(v52));
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  if (a4 < 2)
    goto LABEL_34;
  v11 = a3 + 1;
  v12 = a3[1];
  if (v12 + 2 > (unint64_t)a4)
    goto LABEL_34;
  v13 = *a3;
  if (a3[1])
  {
    if (v12 >= 0x81)
    {
      objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

LABEL_34:
        v28 = 0;
        goto LABEL_35;
      }
      *(_DWORD *)buf = 67109376;
      v47 = v12;
      v48 = 2048;
      v49 = 128;
      v15 = "Error: addr length = %u > sizeof(struct sockaddr_storage) = %lu";
      goto LABEL_7;
    }
    v19 = a3[2];
    if (v19 == 2)
    {
      if (v12 <= 0xF)
      {
        objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        *(_DWORD *)buf = 67109376;
        v47 = v12;
        v48 = 2048;
        v49 = 16;
        v15 = "Error: addr length = %d < sizeof(struct sockaddr_in) = %lu";
        goto LABEL_7;
      }
    }
    else
    {
      if (v19 != 30)
      {
        objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        *(_DWORD *)buf = 67109120;
        v47 = v19;
        v15 = "Error: addr sa_family = %d not AF_INET (2) or AF_INET6 (30)";
        goto LABEL_21;
      }
      if (v12 <= 0x1B)
      {
        objc_msgSend_interface(IDSFoundationLog, v11, v7, 0.0, v42, v43, v44, v45);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        *(_DWORD *)buf = 67109376;
        v47 = v12;
        v48 = 2048;
        v49 = 28;
        v15 = "Error: addr length = %d < sizeof(struct sockaddr_in6) = %lu";
        goto LABEL_7;
      }
    }
    v20 = v12 + 1;
    v18 = v52;
    __memcpy_chk();
    LOBYTE(v52[0]) = v12;
    BYTE1(v52[0]) = v19;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 2;
  }
  *((_QWORD *)&v43 + 1) = v18;
  v21 = &a3[v20];
  v22 = *(unsigned __int8 *)v21;
  v23 = v20 + 1;
  if (v23 + v22 > (unint64_t)a4)
    goto LABEL_34;
  if (*v21)
  {
    if (v22 >= 0x81)
    {
      objc_msgSend_interface(IDSFoundationLog, v21, v7, v10, v42, v43, v44, v45);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_DWORD *)buf = 67109376;
      v47 = v22;
      v48 = 2048;
      v49 = 128;
      v15 = "Error: netmask length = %u > sizeof(struct sockaddr_storage) = %lu";
      goto LABEL_7;
    }
    v24 = a3[v23];
    if (v24 != v19)
    {
      objc_msgSend_interface(IDSFoundationLog, v21, v7, v10, v42, v43, v44, v45);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_DWORD *)buf = 67109376;
      v47 = v24;
      v48 = 1024;
      LODWORD(v49) = BYTE1(v52[0]);
      v15 = "Error: netmask sa_family %d != addr sa_family %d";
      goto LABEL_42;
    }
    if (v22 >= 3)
      __memcpy_chk();
    LOBYTE(v51[0]) = v22;
    BYTE1(v51[0]) = v19;
    *(_QWORD *)&v44 = v51;
    LODWORD(v23) = v20 + v22;
  }
  else
  {
    *(_QWORD *)&v44 = 0;
  }
  v25 = &a3[v23];
  v26 = *v25;
  v27 = v23 + 1;
  if (v27 + v26 > (unint64_t)a4)
    goto LABEL_34;
  if (!*v25)
  {
    *((_QWORD *)&v44 + 1) = 0;
    goto LABEL_55;
  }
  if (v26 >= 0x81)
  {
    objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109376;
    v47 = v26;
    v48 = 2048;
    v49 = 128;
    v15 = "Error: dstaddr length = %u > sizeof(struct sockaddr_storage) = %lu";
    goto LABEL_7;
  }
  v30 = a3[v27];
  if (v30 == 2)
  {
    if (v26 <= 0xF)
    {
      objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_DWORD *)buf = 67109376;
      v47 = v26;
      v48 = 2048;
      v49 = 16;
      v15 = "Error: dstaddr length = %d < sizeof(struct sockaddr_in) = %lu";
LABEL_7:
      v16 = v14;
      v17 = 18;
LABEL_8:
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      goto LABEL_9;
    }
    goto LABEL_54;
  }
  if (v30 != 30)
  {
    objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109120;
    v47 = v30;
    v15 = "Error: dstaddr sa_family = %d not AF_INET (2) or AF_INET6 (30)";
LABEL_21:
    v16 = v14;
    v17 = 8;
    goto LABEL_8;
  }
  if (v26 <= 0x1B)
  {
    objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109376;
    v47 = v26;
    v48 = 2048;
    v49 = 28;
    v15 = "Error: dstaddr length = %d < sizeof(struct sockaddr_in6) = %lu";
    goto LABEL_7;
  }
LABEL_54:
  __memcpy_chk();
  LOBYTE(v50[0]) = v26;
  BYTE1(v50[0]) = v30;
  LODWORD(v27) = v23 + v26;
  *((_QWORD *)&v44 + 1) = v50;
LABEL_55:
  v31 = a3[v27];
  v32 = v27 + 1 + v31;
  v33 = (v32 + 1);
  if (v33 > a4)
    goto LABEL_34;
  if (a3[v27])
  {
    *((_QWORD *)&v42 + 1) = &a3[(v27 + 1)];
    if (v31 >= 0x11)
    {
      objc_msgSend_interface(IDSFoundationLog, v25, v7, v10, v42, v43, v44, v45);
      v14 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      *(_DWORD *)buf = 67109376;
      v47 = v31;
      v48 = 1024;
      LODWORD(v49) = 16;
      v15 = "Error: len: %u is greater than IFNAMSIZ: %d";
LABEL_42:
      v16 = v14;
      v17 = 14;
      goto LABEL_8;
    }
  }
  else
  {
    *((_QWORD *)&v42 + 1) = 0;
    v32 = v27 + 2;
    LODWORD(v33) = v27 + 3;
  }
  if (v33 + a3[v32] > (unint64_t)a4)
    goto LABEL_34;
  if (v8 && v18 && *((_BYTE *)v18 + 1) == 30)
  {
    v34 = objc_retainAutorelease(v8);
    v38 = (const char *)objc_msgSend_UTF8String(v34, v35, v36, v37, v42, v43, v44, v45);
    *((_DWORD *)v18 + 6) = if_nametoindex(v38);
  }
  v39 = [IDSInterfaceAddress alloc];
  v28 = (void *)objc_msgSend_initWithInterfaceAddress_bflags_(v39, v40, (uint64_t)&v42, v41, v13);
LABEL_35:

  return v28;
}

+ (id)interfaceAddress:(ifaddrs *)a3 eflags:(unint64_t)a4 v6flags:(int)a5 iftype:(int)a6
{
  unsigned int v7;
  IDSInterfaceAddress *v8;
  const char *v9;
  double v10;

  v7 = (a5 >> 5) & 4 | (a4 >> 20) & 1 | (a4 >> 10) & 0x10 | (a4 >> 11) & 2 | (8 * (a6 == 5)) | (32 * (a6 == 7)) | ((a6 == 2) << 6);
  v8 = [IDSInterfaceAddress alloc];
  return (id)objc_msgSend_initWithInterfaceAddress_bflags_(v8, v9, (uint64_t)a3, v10, v7);
}

+ (id)addressesFromInterfaceAddresses:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  __CFArray *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v17, 0.0, v21, 16);
  if (v5)
  {
    v9 = v5;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v10)
        {
          v10 = (__CFArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (!v10)
            continue;
        }
        objc_msgSend_address(v13, v6, v7, v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend_address(v13, v6, v7, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          CFArrayAppendValue(v10, v15);

        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v17, v8, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  double v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = CFSTR("YES");
  if (self->_AWDL)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_Cellular)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (self->_expensive)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_constrained)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_companionLink)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_wired)
    v3 = CFSTR("NO");
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], (const char *)v6, (uint64_t)CFSTR("<%@/%@/%@/%@/%@/%@/%@/%@/%@/%@/%@>"), v2, self->_address, self->_netmask, self->_destination, self->_name, self->_delegatedName, v4, v5, v6, v7, v8, v3);
}

- (unint64_t)IPVersion
{
  uint64_t v2;
  double v3;

  return *(unsigned __int8 *)(objc_msgSend_sa(self->_address, a2, v2, v3) + 1) != 2;
}

- (int64_t)getTransmittableBytes:(char *)a3 withPrefixByte:(unsigned __int8)a4
{
  double v4;
  const char *v7;
  uint64_t v8;
  unsigned __int8 *v9;
  double v10;
  char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  double v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  double v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  const char *v28;
  uint64_t v29;
  double v30;
  const void *v31;
  uint64_t v32;

  *a3 = a4;
  a3[1] = self->_AWDL;
  v9 = (unsigned __int8 *)objc_msgSend_sa(self->_address, a2, (uint64_t)a3, v4);
  v11 = a3 + 2;
  if (v9)
  {
    memcpy(v11, v9, *v9);
    v12 = *v9 + 2;
  }
  else
  {
    *v11 = 0;
    v12 = 3;
  }
  v15 = (unsigned __int8 *)objc_msgSend_sa(self->_netmask, v7, v8, v10);
  v17 = &a3[v12];
  if (v15)
  {
    memcpy(v17, v15, *v15);
    v18 = *v15;
  }
  else
  {
    *v17 = 0;
    v18 = 1;
  }
  v19 = v18 + v12;
  v22 = (unsigned __int8 *)objc_msgSend_sa(self->_destination, v13, v14, v16);
  v24 = &a3[v19];
  if (v22)
  {
    memcpy(v24, v22, *v22);
    v25 = *v22;
  }
  else
  {
    *v24 = 0;
    v25 = 1;
  }
  v26 = v25 + v19;
  v27 = objc_msgSend_length(self->_name, v20, v21, v23);
  a3[v26] = v27 + 1;
  v31 = (const void *)objc_msgSend_UTF8String(self->_name, v28, v29, v30);
  memcpy(&a3[v26 + 1], v31, v27);
  v32 = v26 + 1 + v27;
  *(_WORD *)&a3[v32] = 0;
  return v32 + 2;
}

- (IDSInterfaceAddress)initWithInterfaceAddress:(ifaddrs *)a3 bflags:(unsigned __int8)a4
{
  IDSInterfaceAddress *v6;
  IDSSockAddrWrapper *v7;
  const char *v8;
  double v9;
  uint64_t v10;
  IDSSockAddrWrapper *address;
  IDSSockAddrWrapper *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  IDSSockAddrWrapper *netmask;
  IDSSockAddrWrapper *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  IDSSockAddrWrapper *destination;
  void *v22;
  id v23;
  const char *v24;
  double v25;
  uint64_t v26;
  NSString *name;
  sockaddr *ifa_addr;
  id v29;
  const char *v30;
  double v31;
  uint64_t v32;
  NSString *delegatedName;
  NSObject *v34;
  IDSInterfaceAddress *v35;
  objc_super v37;
  uint8_t buf[24];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)IDSInterfaceAddress;
  v6 = -[IDSInterfaceAddress init](&v37, sel_init);
  if (!v6)
    goto LABEL_29;
  if (a3->ifa_addr)
  {
    v7 = [IDSSockAddrWrapper alloc];
    v10 = objc_msgSend_initWithSockAddr_(v7, v8, (uint64_t)a3->ifa_addr, v9);
    address = v6->_address;
    v6->_address = (IDSSockAddrWrapper *)v10;

  }
  if (a3->ifa_netmask)
  {
    v12 = [IDSSockAddrWrapper alloc];
    v15 = objc_msgSend_initWithSockAddr_(v12, v13, (uint64_t)a3->ifa_netmask, v14);
    netmask = v6->_netmask;
    v6->_netmask = (IDSSockAddrWrapper *)v15;

  }
  if (a3->ifa_dstaddr)
  {
    v17 = [IDSSockAddrWrapper alloc];
    v20 = objc_msgSend_initWithSockAddr_(v17, v18, (uint64_t)a3->ifa_dstaddr, v19);
    destination = v6->_destination;
    v6->_destination = (IDSSockAddrWrapper *)v20;

  }
  if (!v6->_address)
  {
    v35 = 0;
    goto LABEL_31;
  }
  if (a3->ifa_name)
  {
    v22 = (void *)MEMORY[0x1A1AC8274]();
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    v26 = objc_msgSend_initWithCString_encoding_(v23, v24, (uint64_t)a3->ifa_name, v25, 4);
    name = v6->_name;
    v6->_name = (NSString *)v26;

    v6->_index = if_nametoindex(a3->ifa_name);
    memset(buf, 170, 16);
    ifa_addr = a3->ifa_addr;
    if (ifa_addr)
    {
      if (getEffectiveInterface((uint64_t)a3->ifa_name, ifa_addr->sa_family, (char *)buf, &v6->_delegatedIndex))
      {
        v29 = objc_alloc(MEMORY[0x1E0CB3940]);
        v32 = objc_msgSend_initWithCString_encoding_(v29, v30, (uint64_t)buf, v31, 4);
        delegatedName = v6->_delegatedName;
        v6->_delegatedName = (NSString *)v32;

      }
      v6->_constrained = isInterfaceConstrained((uint64_t)a3->ifa_name, a3->ifa_addr->sa_family);
    }
    objc_autoreleasePoolPop(v22);
  }
  if ((a4 & 0x20) != 0)
  {
    v6->_companionLink = 1;
    OSLogHandleForTransportCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "interface is CompanionLink", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport(CFSTR("IDSInterface"), CFSTR("IDS"), CFSTR("interface is CompanionLink"));
        if (_IDSShouldLog())
          _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("IDSInterface"), CFSTR("interface is CompanionLink"));
      }
    }
  }
  if ((a4 & 1) != 0)
  {
    v6->_AWDL = 1;
    if ((a4 & 8) == 0)
    {
LABEL_24:
      if ((a4 & 4) == 0)
        goto LABEL_25;
      goto LABEL_34;
    }
  }
  else if ((a4 & 8) == 0)
  {
    goto LABEL_24;
  }
  v6->_Cellular = 1;
  if ((a4 & 4) == 0)
  {
LABEL_25:
    if ((a4 & 0x10) == 0)
      goto LABEL_26;
    goto LABEL_35;
  }
LABEL_34:
  v6->_temporary = 1;
  if ((a4 & 0x10) == 0)
  {
LABEL_26:
    if ((a4 & 0x40) == 0)
      goto LABEL_27;
LABEL_36:
    v6->_wired = 1;
    if ((a4 & 2) == 0)
      goto LABEL_29;
    goto LABEL_28;
  }
LABEL_35:
  v6->_expensive = 1;
  if ((a4 & 0x40) != 0)
    goto LABEL_36;
LABEL_27:
  if ((a4 & 2) != 0)
LABEL_28:
    v6->_clat46 = 1;
LABEL_29:
  v35 = v6;
LABEL_31:

  return v35;
}

- (IDSSockAddrWrapper)address
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 8, 1);
}

- (IDSSockAddrWrapper)external
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExternal:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (IDSSockAddrWrapper)netmask
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 24, 1);
}

- (IDSSockAddrWrapper)destination
{
  return (IDSSockAddrWrapper *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)index
{
  return self->_index;
}

- (NSString)delegatedName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)delegatedIndex
{
  return self->_delegatedIndex;
}

- (BOOL)isAWDL
{
  return self->_AWDL;
}

- (BOOL)isCellular
{
  return self->_Cellular;
}

- (BOOL)isTemporaryIPv6
{
  return self->_temporary;
}

- (NSData)bssid
{
  return (NSData *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isCompanionLink
{
  return self->_companionLink;
}

- (BOOL)isWired
{
  return self->_wired;
}

- (BOOL)expensive
{
  return self->_expensive;
}

- (BOOL)constrained
{
  return self->_constrained;
}

- (void)setConstrained:(BOOL)a3
{
  self->_constrained = a3;
}

- (BOOL)clat46
{
  return self->_clat46;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_delegatedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_netmask, 0);
  objc_storeStrong((id *)&self->_external, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
