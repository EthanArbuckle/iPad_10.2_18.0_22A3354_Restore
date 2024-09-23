@implementation NEIKEv2IdentifierPayload

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
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Identifier"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2IdentifierPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    self = (NEIKEv2IdentifierPayload *)objc_getProperty(self, a2, 24, 1);
  return self != 0;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  id v4;
  const char *v6;
  SEL v7;
  id Property;
  const char *v9;
  void *v10;
  id v11;
  id v12;
  char isKindOfClass;
  const char *v14;
  id v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v38;
  void *v39;
  id v40;
  _TtC16NetworkExtension20NEIKEv2CryptoKitHPKE *v41;
  void *v42;
  void *ErrorInternal;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  NSObject *v52;
  unsigned __int8 v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  int v57;
  id obj;
  _BYTE location[24];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      goto LABEL_3;
    if (-[NEIKEv2IdentifierPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v57 = objc_msgSend(objc_getProperty(self, v6, 24, 1), "identifierType");
      Property = objc_getProperty(self, v7, 24, 1);
      goto LABEL_7;
    }
LABEL_41:
    ne_log_obj();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_error_impl(&dword_19BD16000, v54, OS_LOG_TYPE_ERROR, "ID payload missing required fields", location, 2u);
    }

    return 0;
  }
  if ((objc_msgSend(0, "hasRequiredFields") & 1) == 0)
    goto LABEL_41;
  v53 = objc_msgSend(0, "identifierType");
  Property = 0;
  v57 = v53;
LABEL_7:
  objc_msgSend(Property, "identifierData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v11 = objc_getProperty(self, v9, 24, 1);
  else
    v11 = 0;
  v12 = v11;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v42 = v10;
LABEL_31:
    v49 = objc_msgSend(v42, "length", v55) + 4;
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v49);
    objc_msgSend(v50, "appendBytes:length:", &v57, 4);
    objc_msgSend(v50, "appendData:", v42);
    if (!self)
    {

      v4 = 0;
      return v4 != 0;
    }
    objc_setProperty_atomic(self, v51, v50, 16);

LABEL_3:
    v4 = objc_getProperty(self, v3, 16, 1);
    return v4 != 0;
  }
  if (self)
  {
    v15 = objc_getProperty(self, v14, 24, 1);
    v16 = objc_loadWeakRetained((id *)&self->_ikeSA);
    v24 = v16;
    if (v15)
    {
      if (v16)
      {
        v25 = (id *)v15;
        *(_QWORD *)location = 0;
        objc_msgSend(v25, "identifierData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");

        if (v27)
        {
          v35 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v24, location);
          if (v35)
          {
            v55 = (uint64_t)v15;
            v56 = v10;
            v36 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v24, location);
            if (v36)
            {
              v37 = v25[2];
              v38 = [_TtC16NetworkExtension20NEIKEv2CryptoKitHPKE alloc];
              objc_msgSend(v25, "identifierData");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v25[4];
              if (v37)
              {
                v41 = -[NEIKEv2CryptoKitHPKE initWithPayload:aad:psk:pskID:keyRef:](v38, "initWithPayload:aad:psk:pskID:keyRef:", v39, v40, v36, v35, v25[2]);
              }
              else
              {
                v44 = v25[3];
                v41 = -[NEIKEv2CryptoKitHPKE initWithPayload:aad:psk:pskID:keyData:](v38, "initWithPayload:aad:psk:pskID:keyData:", v39, v40, v36, v35, v44);

              }
              obj = *(id *)location;
              -[NEIKEv2CryptoKitHPKE performHPKESealAndReturnError:](v41, "performHPKESealAndReturnError:", &obj);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_storeStrong((id *)location, obj);

            }
            else
            {
              v42 = 0;
            }
            v15 = (id)v55;
            v10 = v56;

          }
          else
          {
            v42 = 0;
          }

          ErrorInternal = *(void **)location;
        }
        else
        {
          ErrorInternal = (void *)NEIKEv2CreateErrorInternal(CFSTR("Missing identifier data"), v28, v29, v30, v31, v32, v33, v34, v55);
          v42 = 0;
          *(_QWORD *)location = ErrorInternal;
        }
        v45 = ErrorInternal;
        if (v45)
        {

          v42 = 0;
          v46 = *(void **)location;
        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        v45 = (id)NEIKEv2CreateErrorInternal(CFSTR("Missing IKE SA"), v17, v18, v19, v20, v21, v22, v23, v55);
        v42 = 0;
      }
      v47 = objc_retainAutorelease(v45);

      goto LABEL_29;
    }
    v47 = 0;
  }
  else
  {
    v47 = 0;
    v15 = 0;
    v24 = 0;
  }
  v42 = 0;
LABEL_29:

  v48 = v47;
  if (v42)
  {

    goto LABEL_31;
  }
  ne_log_obj();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 138412290;
    *(_QWORD *)&location[4] = v48;
    _os_log_error_impl(&dword_19BD16000, v52, OS_LOG_TYPE_ERROR, "Failed to generate encrypted identifier payload: %@", location, 0xCu);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  SEL v8;
  id v9;
  SEL v10;
  id v11;
  void *v12;
  id v13;
  SEL v14;
  SEL v15;
  NSObject *v16;
  int v18;
  uint8_t buf[4];
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v20 = "-[NEIKEv2IdentifierPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_16;
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
      *(_QWORD *)v20 = "-[NEIKEv2IdentifierPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_id_hdr_t))";
LABEL_16:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v18 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v18, 4);
  v9 = objc_getProperty(self, v8, 16, 1);
  v11 = objc_getProperty(self, v10, 16, 1);
  objc_msgSend(v9, "subdataWithRange:", 4, objc_msgSend(v11, "length") - 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[NEIKEv2Identifier createIdentifierWithType:data:](NEIKEv2Identifier, "createIdentifierWithType:data:", v18, v12);
  objc_setProperty_atomic(self, v14, v13, 24);

  if (objc_getProperty(self, v15, 24, 1))
  {
    v7 = -[NEIKEv2IdentifierPayload hasRequiredFields](self, "hasRequiredFields");
  }
  else
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v20[0] = v18;
      LOWORD(v20[1]) = 2112;
      *(_QWORD *)((char *)&v20[1] + 2) = v12;
      _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Failed to parse identifier type %u data %@", buf, 0x12u);
    }

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ikeSA);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("ID");
}

@end
