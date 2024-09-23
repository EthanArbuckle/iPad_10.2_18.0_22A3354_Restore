@implementation NEIKEv2TrafficSelectorPayload

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
    Property = objc_getProperty(self, v9, 24, 1);
  else
    Property = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Traffic Selectors"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2TrafficSelectorPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    self = (NEIKEv2TrafficSelectorPayload *)objc_getProperty(self, a2, 24, 1);
  return -[NEIKEv2TrafficSelectorPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  NEIKEv2TrafficSelectorPayload *v2;
  const char *v3;
  const char *v4;
  id v5;
  id v6;
  const char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  __int16 v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  const char *v37;
  id Property;
  NEIKEv2TrafficSelectorPayload *selfa;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[48];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_56:
    Property = objc_getProperty(v2, v3, 16, 1);
    return Property != 0;
  }
  if (!-[NEIKEv2TrafficSelectorPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, "Traffic Selector payload missing required fields", buf, 2u);
    }

    return 0;
  }
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v2)
    v6 = objc_getProperty(v2, v4, 24, 1);
  else
    v6 = 0;
  v40 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  selfa = v2;
  if (v2)
    v8 = objc_getProperty(v2, v7, 24, 1);
  else
    v8 = 0;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_47;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v47 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
      if (!-[NEIKEv2TrafficSelector type]((uint64_t)v15))
      {
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v23 = v22;
          v24 = "Traffic selector invalid";
          goto LABEL_33;
        }
LABEL_34:

        continue;
      }
      v16 = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
      objc_msgSend(v15, "startAddress");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "address");

      objc_msgSend(v15, "endAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "address");

      if (v16 != 7)
      {
        if (v18)
        {
          if (v20)
          {
            memset(buf, 0, 40);
            buf[0] = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
            *(_WORD *)&buf[2] = 10240;
            buf[1] = objc_msgSend(v15, "ipProtocol");
            *(_WORD *)&buf[4] = __rev16(objc_msgSend(v15, "startPort"));
            if (objc_msgSend(v15, "endPort"))
              v25 = __rev16(objc_msgSend(v15, "endPort"));
            else
              v25 = -1;
            *(_WORD *)&buf[6] = v25;
            *(_OWORD *)&buf[8] = *(_OWORD *)(v18 + 8);
            *(_OWORD *)&buf[24] = *(_OWORD *)(v20 + 8);
            v12 += 40;
            v26 = objc_alloc(MEMORY[0x1E0C99D50]);
            v27 = 40;
            goto LABEL_39;
          }
          ne_log_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            goto LABEL_34;
        }
        else
        {
          ne_log_obj();
          v22 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            goto LABEL_34;
        }
LABEL_32:
        *(_WORD *)buf = 0;
        v23 = v22;
        v24 = "Traffic selector missing start address";
LABEL_33:
        _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
        goto LABEL_34;
      }
      if (!v18)
      {
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        goto LABEL_32;
      }
      if (!v20)
      {
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        goto LABEL_32;
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      buf[0] = -[NEIKEv2TrafficSelector type]((uint64_t)v15);
      *(_WORD *)&buf[2] = 4096;
      buf[1] = objc_msgSend(v15, "ipProtocol");
      *(_WORD *)&buf[4] = __rev16(objc_msgSend(v15, "startPort"));
      if (objc_msgSend(v15, "endPort"))
        v21 = __rev16(objc_msgSend(v15, "endPort"));
      else
        v21 = -1;
      *(_WORD *)&buf[6] = v21;
      *(_DWORD *)&buf[8] = *(_DWORD *)(v18 + 4);
      *(_DWORD *)&buf[12] = *(_DWORD *)(v20 + 4);
      v12 += 16;
      v26 = objc_alloc(MEMORY[0x1E0C99D50]);
      v27 = 16;
LABEL_39:
      v28 = (void *)objc_msgSend(v26, "initWithBytes:length:", buf, v27, selfa);
      objc_msgSend(v40, "addObject:", v28);

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  }
  while (v11);
LABEL_47:

  *(_DWORD *)buf = 0;
  buf[0] = objc_msgSend(v40, "count");
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v12 + 4);
  objc_msgSend(v31, "appendBytes:length:", buf, 4);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v32 = v40;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(v31, "appendData:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j), selfa);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v34);
  }

  v2 = selfa;
  if (selfa)
  {
    objc_setProperty_atomic(selfa, v37, v31, 16);

    goto LABEL_56;
  }

  Property = 0;
  return Property != 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  id v9;
  SEL v10;
  unsigned int v11;
  const char *v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  const char *v16;
  unsigned int v17;
  uint64_t v18;
  id v19;
  unsigned __int8 *v20;
  unsigned int v21;
  unsigned int v22;
  NSObject *v23;
  NEIKEv2TrafficSelector *v24;
  int v25;
  void *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  int v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  int v39;
  _DWORD v40[7];
  uint8_t buf[4];
  _QWORD v42[5];

  *(_QWORD *)((char *)&v42[3] + 4) = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42[0] = "-[NEIKEv2TrafficSelectorPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_44;
    }
LABEL_7:

    return 0;
  }
  if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") <= 3)
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v42[0] = "-[NEIKEv2TrafficSelectorPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_ts_hdr_t))";
LABEL_44:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v39 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v39, 4);
  v8 = v39;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = objc_msgSend(objc_getProperty(self, v10, 16, 1), "length");
  v14 = v11;
  if (v11 < 0xCuLL)
  {
    v15 = objc_msgSend(v9, "count");
    goto LABEL_36;
  }
  v17 = v11;
  v37 = v8;
  v38 = v9;
  v18 = 4;
  *(_QWORD *)&v13 = 67109376;
  v36 = v13;
  while (1)
  {
    v19 = objc_getProperty(self, v12, 16, 1);
    v20 = (unsigned __int8 *)(objc_msgSend(v19, "bytes") + v18);
    v21 = *((unsigned __int16 *)v20 + 1);
    v22 = __rev16(v21);
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v31 = *v20;
      *(_DWORD *)buf = v36;
      LODWORD(v42[0]) = v31;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = v22;
      _os_log_debug_impl(&dword_19BD16000, v23, OS_LOG_TYPE_DEBUG, "Parsing traffic selector of type %u length %u", buf, 0xEu);
    }

    v18 = v18 + v22;
    if (v18 > v17)
      break;
    v24 = objc_alloc_init(NEIKEv2TrafficSelector);
    -[NEIKEv2TrafficSelector setIpProtocol:](v24, "setIpProtocol:", v20[1]);
    -[NEIKEv2TrafficSelector setStartPort:](v24, "setStartPort:", bswap32(*((unsigned __int16 *)v20 + 2)) >> 16);
    -[NEIKEv2TrafficSelector setEndPort:](v24, "setEndPort:", bswap32(*((unsigned __int16 *)v20 + 3)) >> 16);
    v25 = *v20;
    if (v25 == 8)
    {
      if (v21 == 10240)
      {
        memset(v42, 0, 24);
        *(_DWORD *)buf = 7708;
        *(_OWORD *)((char *)v42 + 4) = *(_OWORD *)(v20 + 8);
        memset(&v40[1], 0, 24);
        v40[0] = 7708;
        *(_OWORD *)&v40[2] = *(_OWORD *)(v20 + 24);
        goto LABEL_20;
      }
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42[0]) = v22;
        v29 = v27;
        v30 = "Bad traffic IPv6 traffic selector length (%u)";
        goto LABEL_31;
      }
    }
    else
    {
      if (v25 != 7)
      {
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          v28 = *v20;
          *(_DWORD *)buf = 67109120;
          LODWORD(v42[0]) = v28;
          _os_log_impl(&dword_19BD16000, v27, OS_LOG_TYPE_INFO, "Unknown traffic selector type %u", buf, 8u);
        }
        goto LABEL_26;
      }
      if (v21 == 4096)
      {
        LODWORD(v42[1]) = 0;
        v42[0] = 0;
        *(_DWORD *)buf = 528;
        LODWORD(v42[0]) = *((_DWORD *)v20 + 2);
        v40[3] = 0;
        *(_QWORD *)&v40[1] = 0;
        v40[0] = 528;
        v40[1] = *((_DWORD *)v20 + 3);
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", buf, v36);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setStartAddress:](v24, "setStartAddress:", v26);

        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v40);
        v27 = objc_claimAutoreleasedReturnValue();
        -[NEIKEv2TrafficSelector setEndAddress:](v24, "setEndAddress:", v27);
        goto LABEL_26;
      }
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v42[0]) = v22;
        v29 = v27;
        v30 = "Bad traffic IPv4 traffic selector length (%u)";
LABEL_31:
        _os_log_error_impl(&dword_19BD16000, v29, OS_LOG_TYPE_ERROR, v30, buf, 8u);
      }
    }
LABEL_26:

    if (v24)
      objc_msgSend(v38, "addObject:", v24);

    if (v18 + 8 > v14)
      goto LABEL_35;
  }
  ne_log_obj();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v42[0]) = v22;
    _os_log_error_impl(&dword_19BD16000, v32, OS_LOG_TYPE_ERROR, "Invalid traffic selector length (%u)", buf, 8u);
  }

LABEL_35:
  v9 = v38;
  v15 = objc_msgSend(v38, "count", v36);
  v8 = v37;
LABEL_36:
  if (v15 == v8)
  {
    objc_setProperty_atomic(self, v16, v9, 24);
    v7 = -[NEIKEv2TrafficSelectorPayload hasRequiredFields](self, "hasRequiredFields");
  }
  else
  {
    ne_log_obj();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 67109376;
      LODWORD(v42[0]) = v35;
      WORD2(v42[0]) = 1024;
      *(_DWORD *)((char *)v42 + 6) = v8;
      _os_log_error_impl(&dword_19BD16000, v33, OS_LOG_TYPE_ERROR, "Failed to process all traffic selectors (%u/%u)", buf, 0xEu);
    }

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficSelectors, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("TS");
}

@end
