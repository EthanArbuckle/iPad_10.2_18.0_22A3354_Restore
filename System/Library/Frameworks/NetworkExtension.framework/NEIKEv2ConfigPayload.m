@implementation NEIKEv2ConfigPayload

- (unint64_t)type
{
  return 47;
}

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
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Configuration"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2ConfigPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
  {
    self = (NEIKEv2ConfigPayload *)objc_getProperty(self, a2, 24, 1);
    if (self)
      LOBYTE(self) = *(_QWORD *)&self->super._isInbound != 0;
  }
  return (char)self;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  const char *v4;
  id v5;
  int *v6;
  id v7;
  const char *v8;
  id v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  NEIKEv2ConfigPayload *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  int *p_b;
  void *v35;
  void *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  const char *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  const char *v54;
  id Property;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  int __b;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  NEIKEv2ConfigPayload *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
LABEL_71:
    Property = objc_getProperty(self, v3, 16, 1);
    return Property != 0;
  }
  if (!-[NEIKEv2ConfigPayload hasRequiredFields](self, "hasRequiredFields"))
  {
    ne_log_obj();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = self;
      _os_log_fault_impl(&dword_19BD16000, v43, OS_LOG_TYPE_FAULT, "Configuration payload missing required fields %@", buf, 0xCu);
    }

    return 0;
  }
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v6 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
  if (self)
  {
    v7 = objc_getProperty(self, v4, 24, 1);
    if (v7)
      v7 = objc_getProperty(v7, v8, 16, 1);
  }
  else
  {
    v7 = 0;
  }
  v9 = v7;
  v10 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v9, "count"));

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  if (self)
  {
    v12 = objc_getProperty(self, v11, 24, 1);
    if (v12)
      v12 = objc_getProperty(v12, v13, 16, 1);
  }
  else
  {
    v12 = 0;
  }
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (!v15)
  {
    v18 = 0;
    goto LABEL_59;
  }
  v17 = v15;
  v18 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v63;
  *(_QWORD *)&v16 = 138412290;
  v56 = v16;
  for (i = *(_QWORD *)v63; ; i = *(_QWORD *)v63)
  {
    if (i != v20)
      objc_enumerationMutation(v14);
    v22 = *(NEIKEv2ConfigPayload **)(*((_QWORD *)&v62 + 1) + 8 * v19);
    if (!-[NEIKEv2ConfigPayload attributeType](v22, "attributeType", v56))
    {
      ne_log_obj();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = v56;
        v69 = v22;
        _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, "AttributeType 0 invalid in %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
    if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NEIKEv2ConfigPayload stringValue](v22, "stringValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          -[NEIKEv2ConfigPayload stringValue](v22, "stringValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "dataUsingEncoding:", 4);
          v25 = objc_claimAutoreleasedReturnValue();

          *(_DWORD *)buf = 0;
          v26 = -[NEIKEv2ConfigPayload attributeType](v22, "attributeType");
          v27 = -[NSObject length](v25, "length");
          *(_WORD *)buf = bswap32(v26) >> 16;
          *(_WORD *)&buf[2] = bswap32(v27) >> 16;
          v28 = -[NSObject length](v25, "length") + 4;
          v18 += v28;
          v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v28);
          objc_msgSend(v29, "appendBytes:length:", buf, 4);
          objc_msgSend(v29, "appendData:", v25);
          objc_msgSend(v10, "addObject:", v29);

LABEL_26:
          goto LABEL_50;
        }
LABEL_34:
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32(-[NEIKEv2ConfigPayload attributeType](v22, "attributeType")) >> 16;
        *(_WORD *)&buf[2] = 0;
        v18 += 4;
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buf, 4);
        goto LABEL_49;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEIKEv2ConfigPayload address](v22, "address");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
        goto LABEL_34;
      -[NEIKEv2ConfigPayload address](v22, "address");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "address");

      if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 1 && *(_BYTE *)(v32 + 1) == 2)
      {
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32(-[NEIKEv2ConfigPayload attributeType](v22, "attributeType")) >> 16;
        *(_WORD *)&buf[2] = 1024;
        v33 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
        objc_msgSend(v33, "appendBytes:length:", buf, 4);
        p_b = (int *)(v32 + 4);
        goto LABEL_47;
      }
      if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 2 && *(_BYTE *)(v32 + 1) == 30)
      {
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32(-[NEIKEv2ConfigPayload attributeType](v22, "attributeType")) >> 16;
        *(_WORD *)&buf[2] = 4096;
        v18 += 20;
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 20);
        objc_msgSend(v33, "appendBytes:length:", buf, 4);
        p_b = (int *)(v32 + 8);
        v40 = v33;
        v41 = 16;
        goto LABEL_48;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_50;
      -[NEIKEv2ConfigPayload address](v22, "address");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35)
        goto LABEL_34;
      -[NEIKEv2ConfigPayload address](v22, "address");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "address");

      if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 3 && *(_BYTE *)(v37 + 1) == 2)
      {
        v38 = -[NEIKEv2ConfigPayload prefix](v22, "prefix");
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32(-[NEIKEv2ConfigPayload attributeType](v22, "attributeType")) >> 16;
        *(_WORD *)&buf[2] = 2048;
        __b = 0;
        if (v38 <= 0x20)
        {
          if (v38 >= 8)
          {
            memset(&__b, 255, v38 >> 3);
            v39 = v38 >> 3 <= 1 ? 1 : v38 >> 3;
          }
          else
          {
            v39 = 0;
          }
          if ((v38 & 7) != 0)
            *((_BYTE *)&__b + v39) = 0xFF00u >> (v38 & 7);
        }
        v18 += 12;
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 12);
        objc_msgSend(v33, "appendBytes:length:", buf, 4);
        objc_msgSend(v33, "appendBytes:length:", v37 + 4, 4);
        p_b = &__b;
LABEL_47:
        v40 = v33;
        v41 = 4;
LABEL_48:
        objc_msgSend(v40, "appendBytes:length:", p_b, v41);
LABEL_49:
        objc_msgSend(v10, "addObject:", v33);

        goto LABEL_50;
      }
      if (-[NEIKEv2ConfigPayload valueType](v22, "valueType") == 4 && *(_BYTE *)(v37 + 1) == 30)
      {
        LOBYTE(__b) = 0;
        LOBYTE(__b) = -[NEIKEv2ConfigPayload prefix](v22, "prefix");
        *(_DWORD *)buf = 0;
        *(_WORD *)buf = bswap32(-[NEIKEv2ConfigPayload attributeType](v22, "attributeType")) >> 16;
        *(_WORD *)&buf[2] = 4352;
        v18 += 21;
        v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 21);
        objc_msgSend(v33, "appendBytes:length:", buf, 4);
        objc_msgSend(v33, "appendBytes:length:", v37 + 8, 16);
        p_b = &__b;
        v40 = v33;
        v41 = 1;
        goto LABEL_48;
      }
    }
LABEL_50:
    if (++v19 < v17)
      continue;
    v42 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    if (!v42)
      break;
    v17 = v42;
    v19 = 0;
  }
  v6 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
LABEL_59:

  *(_DWORD *)buf = 0;
  if (self && (v46 = objc_getProperty(self, v45, v6[252], 1)) != 0)
    v47 = v46[1];
  else
    LOBYTE(v47) = 0;
  buf[0] = v47;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v18 + 4);
  objc_msgSend(v48, "appendBytes:length:", buf, 4);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v49 = v10;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v51; ++j)
      {
        if (*(_QWORD *)v58 != v52)
          objc_enumerationMutation(v49);
        objc_msgSend(v48, "appendData:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v51);
  }

  if (self)
  {
    objc_setProperty_atomic(self, v54, v48, 16);

    goto LABEL_71;
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
  NEIKEv2ConfigurationMessage *v8;
  SEL v9;
  uint64_t v10;
  SEL v11;
  _QWORD *Property;
  id v13;
  SEL v14;
  id v15;
  const char *v16;
  SEL v17;
  unsigned int v18;
  const char *v19;
  __int128 v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  id v24;
  unsigned __int16 *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  const char *v30;
  void *v31;
  id v32;
  const char *v33;
  id v34;
  __int128 v35;
  int v36;
  uint8_t buf[4];
  _DWORD v38[7];

  *(_QWORD *)&v38[5] = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v38 = "-[NEIKEv2ConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_26;
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
      *(_QWORD *)v38 = "-[NEIKEv2ConfigPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_config_hdr_t))";
LABEL_26:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v36 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v36, 4);
  v8 = objc_alloc_init(NEIKEv2ConfigurationMessage);
  objc_setProperty_atomic(self, v9, v8, 24);

  v10 = v36;
  Property = objc_getProperty(self, v11, 24, 1);
  if (Property)
    Property[1] = v10;
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_getProperty(self, v14, 24, 1);
  if (v15)
    objc_setProperty_atomic(v15, v16, v13, 16);

  v18 = objc_msgSend(objc_getProperty(self, v17, 16, 1), "length");
  v21 = v18;
  if (v18 >= 5)
  {
    v22 = v18;
    v23 = 4;
    *(_QWORD *)&v20 = 67109376;
    v35 = v20;
    while (1)
    {
      v24 = objc_getProperty(self, v19, 16, 1);
      v25 = (unsigned __int16 *)(objc_msgSend(v24, "bytes") + v23);
      v26 = bswap32(v25[1]) >> 16;
      if (v26 + (unint64_t)v23 + 4 > v22)
        break;
      v27 = bswap32(*v25) >> 16;
      ne_log_obj();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v35;
        v38[0] = v27;
        LOWORD(v38[1]) = 1024;
        *(_DWORD *)((char *)&v38[1] + 2) = v26;
        _os_log_debug_impl(&dword_19BD16000, v28, OS_LOG_TYPE_DEBUG, "Parsing configuration attribute of type %u length %u", buf, 0xEu);
      }

      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v25 + 2, v26);
      -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)self, v29, 0, v26, v27, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v32 = objc_getProperty(self, v30, 24, 1);
        if (v32)
          v32 = objc_getProperty(v32, v33, 16, 1);
        v34 = v32;
        objc_msgSend(v34, "addObject:", v31);

      }
      v23 += v26 + 4;

      if (v23 >= v21)
        return -[NEIKEv2ConfigPayload hasRequiredFields](self, "hasRequiredFields", v35);
    }

  }
  return -[NEIKEv2ConfigPayload hasRequiredFields](self, "hasRequiredFields", v35);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)createConfigAttributeFromData:(void *)a3 attributeName:(unsigned int)a4 attributeLen:(uint64_t)a5 attributeType:(uint64_t)a6 customType:
{
  id v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NEIKEv2IPv4SubnetAttribute *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  objc_class *v26;
  void *v28;
  objc_class *v29;
  id v30;
  uint64_t v31;
  _BYTE v32[32];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  if (a1)
  {
    switch(a5)
    {
      case 1:
      case 2:
      case 3:
      case 6:
      case 20:
        *(_DWORD *)&v32[12] = 0;
        *(_QWORD *)&v32[4] = 0;
        *(_DWORD *)v32 = 528;
        if (a4 == 4)
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(_OWORD *)v32);
        v13 = 0;
        switch(a5)
        {
          case 1:
          case 2:
          case 3:
          case 6:
            goto LABEL_34;
          case 4:
          case 5:
            break;
          default:
            if (a5 == 20)
LABEL_34:
              v13 = (objc_class *)objc_opt_class();
            break;
        }
        v22 = [v13 alloc];
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6)
          v24 = objc_msgSend(v22, "initCustomWithAttributeType:attributeName:addressValue:", a6, v12, v23);
        else
          v24 = objc_msgSend(v22, "initWithAddress:", v23);
        v18 = (void *)v24;

        break;
      case 4:
      case 5:
      case 9:
      case 11:
      case 16:
      case 17:
      case 18:
      case 19:
      case 22:
      case 23:
      case 24:
        goto LABEL_24;
      case 7:
      case 14:
      case 25:
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend(v11, "bytes"), a4, 4);
        if (a5 == 25 || a5 == 14 || a5 == 7)
          v26 = (objc_class *)objc_opt_class();
        else
          v26 = 0;
        v21 = objc_msgSend([v26 alloc], "initWithStringValue:", v14);
        goto LABEL_46;
      case 8:
      case 15:
        memset(&v32[4], 0, 24);
        *(_DWORD *)v32 = 7708;
        if (a4 == 16)
        {
          v16 = 0;
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(_QWORD *)v32, *(_QWORD *)&v32[8], *(_QWORD *)&v32[16], *(_QWORD *)&v32[24]);
        }
        else if (a4 == 17)
        {
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(_QWORD *)v32, *(_QWORD *)&v32[8], *(_QWORD *)&v32[16], *(_QWORD *)&v32[24]);
          v16 = *(unsigned __int8 *)(objc_msgSend(v11, "bytes") + 16);
        }
        else
        {
          v16 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v32);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (a5 == 8 || a5 == 15)
          v29 = (objc_class *)objc_opt_class();
        else
          v29 = 0;
        v30 = [v29 alloc];
        if (a6)
          v31 = objc_msgSend(v30, "initCustomWithAttributeType:attributeName:addressValue:prefix:", a6, v12, v28, v16);
        else
          v31 = objc_msgSend(v30, "initWithAddress:prefix:", v28, v16);
        v18 = (void *)v31;

        break;
      case 10:
      case 12:
      case 21:
        goto LABEL_11;
      case 13:
        v19 = 0;
        *(_DWORD *)&v32[12] = 0;
        *(_QWORD *)&v32[4] = 0;
        *(_DWORD *)v32 = 528;
        if (a4 == 8)
        {
          *(_DWORD *)&v32[4] = *(_DWORD *)objc_msgSend(v11, "bytes", *(_QWORD *)v32, *(_QWORD *)&v32[8]);
          v19 = *(unsigned int *)(objc_msgSend(v11, "bytes") + 4);
        }
        v20 = [NEIKEv2IPv4SubnetAttribute alloc];
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (a6)
          v21 = -[NEIKEv2SubnetAttribute initCustomWithAttributeType:attributeName:addressValue:ipv4SubnetMask:](v20, "initCustomWithAttributeType:attributeName:addressValue:ipv4SubnetMask:", a6, v12, v14, v19);
        else
          v21 = -[NEIKEv2SubnetAttribute initWithAddress:ipv4SubnetMask:](v20, "initWithAddress:ipv4SubnetMask:", v14, v19);
        goto LABEL_46;
      default:
        if ((unint64_t)(a5 - 25958) >= 2)
        {
LABEL_24:
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v32 = 67109376;
            *(_DWORD *)&v32[4] = (unsigned __int16)a5;
            *(_WORD *)&v32[8] = 1024;
            *(_DWORD *)&v32[10] = a4;
            _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_INFO, "Received unknown attribute of type %u length %u", v32, 0xEu);
          }

          goto LABEL_27;
        }
LABEL_11:
        memset(&v32[4], 0, 24);
        *(_DWORD *)v32 = 7708;
        if (a4 == 16)
          *(_OWORD *)&v32[8] = *(_OWORD *)objc_msgSend(v11, "bytes", *(_OWORD *)v32, *(_OWORD *)&v32[16]);
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", v32);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        if (a5 <= 20)
        {
          if (a5 == 10 || a5 == 12)
            goto LABEL_39;
        }
        else if (a5 == 21 || a5 == 25958 || a5 == 25959)
        {
LABEL_39:
          v15 = (objc_class *)objc_opt_class();
        }
        v25 = [v15 alloc];
        if (a6)
          v21 = objc_msgSend(v25, "initCustomWithAttributeType:attributeName:addressValue:", a6, v12, v14);
        else
          v21 = objc_msgSend(v25, "initWithAddress:", v14);
LABEL_46:
        v18 = (void *)v21;

        break;
    }
  }
  else
  {
LABEL_27:
    v18 = 0;
  }

  return v18;
}

+ (id)copyTypeDescription
{
  return CFSTR("CONFIG");
}

@end
