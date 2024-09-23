@implementation NEIKEv2ResponseConfigPayload

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  NEIKEv2ConfigurationMessage *v8;
  SEL v9;
  NEIKEv2ResponseConfigPayload *v10;
  uint64_t v11;
  SEL v12;
  _QWORD *Property;
  id v14;
  NEIKEv2ResponseConfigPayload *v15;
  SEL v16;
  id v17;
  const char *v18;
  SEL v19;
  const char *v20;
  __int128 v21;
  unsigned int v22;
  _UNKNOWN **v23;
  id v24;
  const char *v25;
  unsigned __int16 *v26;
  uint64_t v27;
  id v28;
  int v29;
  uint64_t v30;
  id v31;
  const char *v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const char *v43;
  void *v44;
  id v45;
  const char *v46;
  id v47;
  __int128 v48;
  NEIKEv2ResponseConfigPayload *selfa;
  unsigned int v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  int v55;
  uint8_t buf[4];
  _BYTE v57[10];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v57 = "-[NEIKEv2ResponseConfigPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_58;
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
      *(_QWORD *)v57 = "-[NEIKEv2ResponseConfigPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_config_hdr_t))";
LABEL_58:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v55 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v55, 4);
  v8 = objc_alloc_init(NEIKEv2ConfigurationMessage);
  objc_setProperty_atomic(self, v9, v8, 24);

  v10 = self;
  v11 = v55;
  selfa = v10;
  Property = objc_getProperty(v10, v12, 24, 1);
  if (Property)
    Property[1] = v11;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = selfa;
  v17 = objc_getProperty(selfa, v16, 24, 1);
  if (v17)
    objc_setProperty_atomic(v17, v18, v14, 16);

  v50 = objc_msgSend(objc_getProperty(selfa, v19, 16, 1), "length");
  if (v50 >= 5)
  {
    v22 = 4;
    *(_QWORD *)&v21 = 67109376;
    v48 = v21;
    v23 = &off_1E3CBB000;
    do
    {
      v24 = objc_getProperty(v15, v20, 16, 1);
      v26 = (unsigned __int16 *)(objc_msgSend(v24, "bytes") + v22);
      v27 = bswap32(v26[1]) >> 16;
      if (v27 + (unint64_t)v22 + 4 > v50)
      {

        return -[NEIKEv2ConfigPayload hasRequiredFields](v15, "hasRequiredFields", v48);
      }
      v28 = 0;
      v29 = bswap32(*v26);
      v30 = HIWORD(v29);
      if (v29 >> 16 >= 0x4000 && (unsigned __int16)(HIWORD(v29) - 25960) <= 0xFFFDu)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v31 = objc_getProperty(v15, v25, 32, 1);
        if (v31)
          v31 = objc_getProperty(v31, v32, 16, 1);
        v33 = v31;
        v28 = (id)objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
        if (v28)
        {
          v34 = *(_QWORD *)v52;
          while (2)
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(_QWORD *)v52 != v34)
                objc_enumerationMutation(v33);
              v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
              if ((unint64_t)objc_msgSend(v36, "attributeType", v48) >= 0x4000
                && !((unint64_t)objc_msgSend(v36, "attributeType") >> 15)
                && objc_msgSend(v36, "attributeType") == v30)
              {
                v28 = v36;
                goto LABEL_31;
              }
            }
            v28 = (id)objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
            if (v28)
              continue;
            break;
          }
LABEL_31:
          v15 = selfa;
          v23 = &off_1E3CBB000;
        }

      }
      ne_log_obj();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v48;
        *(_DWORD *)v57 = v30;
        *(_WORD *)&v57[4] = 1024;
        *(_DWORD *)&v57[6] = v27;
        _os_log_debug_impl(&dword_19BD16000, v37, OS_LOG_TYPE_DEBUG, "Parsing configuration attribute of type %u length %u", buf, 0xEu);
      }

      v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v26 + 2, v27);
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = 8;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = 2;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v30 = 15;
              }
            }
          }
          objc_msgSend(v28, "attributeName", v48);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)v15, v38, v44, v27, v30, objc_msgSend(v28, "attributeType"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
            goto LABEL_53;
LABEL_50:
          v45 = objc_getProperty(v15, v43, 24, 1);
          if (v45)
            v45 = objc_getProperty(v45, v46, 16, 1);
          v47 = v45;
          objc_msgSend(v47, "addObject:", v42);

          goto LABEL_53;
        }
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", objc_msgSend(objc_retainAutorelease(v38), "bytes"), v27, 4);
        v40 = objc_alloc((Class)v23[386]);
        objc_msgSend(v28, "attributeName");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v40, "initCustomWithAttributeType:attributeName:stringValue:", v30, v41, v39);

        v23 = &off_1E3CBB000;
        if (v42)
          goto LABEL_50;
      }
      else
      {
        -[NEIKEv2ConfigPayload createConfigAttributeFromData:attributeName:attributeLen:attributeType:customType:]((uint64_t)v15, v38, 0, v27, v30, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
          goto LABEL_50;
      }
LABEL_53:
      v22 += v27 + 4;

    }
    while (v22 < v50);
  }
  return -[NEIKEv2ConfigPayload hasRequiredFields](v15, "hasRequiredFields", v48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationRequest, 0);
}

@end
