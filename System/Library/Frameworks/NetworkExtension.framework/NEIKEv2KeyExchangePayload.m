@implementation NEIKEv2KeyExchangePayload

- (unint64_t)type
{
  return 34;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  SEL v10;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 24, 1), CFSTR("Method"), v5, a4);
    Property = objc_getProperty(self, v10, 32, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Method"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Data"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2KeyExchangePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  NEIKEv2KeyExchangePayload *v2;
  id v3;
  const char *v4;
  void *v5;

  v2 = self;
  if (self)
  {
    v3 = objc_getProperty(self, a2, 24, 1);
    if (v3)
    {
      v5 = v3;
      LOBYTE(v2) = objc_getProperty(v2, v4, 32, 1) != 0;

    }
    else
    {
      LOBYTE(v2) = 0;
    }
  }
  return (char)v2;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  const char *v4;
  SEL v5;
  id Property;
  uint64_t v7;
  void *v8;
  const char *v9;
  SEL v10;
  id v11;
  unsigned int v13;
  NSObject *v14;
  __int16 v15;
  __int16 v16;
  uint8_t buf[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      goto LABEL_7;
    if (-[NEIKEv2KeyExchangePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v16 = 0;
      v15 = bswap32(objc_msgSend(objc_getProperty(self, v4, 24, 1), "method")) >> 16;
      Property = objc_getProperty(self, v5, 32, 1);
LABEL_5:
      v7 = objc_msgSend(Property, "length") + 4;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v7);
      objc_msgSend(v8, "appendBytes:length:", &v15, 4);
      if (!self)
      {
        objc_msgSend(v8, "appendData:", 0);

        v11 = 0;
        return v11 != 0;
      }
      objc_msgSend(v8, "appendData:", objc_getProperty(self, v9, 32, 1));
      objc_setProperty_atomic(self, v10, v8, 16);

LABEL_7:
      v11 = objc_getProperty(self, v3, 16, 1);
      return v11 != 0;
    }
  }
  else if ((objc_msgSend(0, "hasRequiredFields") & 1) != 0)
  {
    v16 = 0;
    v13 = objc_msgSend(0, "method");
    Property = 0;
    v15 = bswap32(v13) >> 16;
    goto LABEL_5;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "KE payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  NEIKEv2KEMProtocol *v8;
  NEIKEv2KEMProtocol *v9;
  SEL v10;
  SEL v11;
  id v12;
  SEL v13;
  id v14;
  void *v15;
  SEL v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315138;
      v18 = "-[NEIKEv2KeyExchangePayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_11;
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
      v17 = 136315138;
      v18 = "-[NEIKEv2KeyExchangePayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_ke_hdr_t))";
LABEL_11:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, (uint8_t *)&v17, 0xCu);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v17 = 0;
  objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v17, 4);
  v8 = [NEIKEv2KEMProtocol alloc];
  v9 = -[NEIKEv2KEMProtocol initWithMethod:](v8, "initWithMethod:", bswap32((unsigned __int16)v17) >> 16);
  objc_setProperty_atomic(self, v10, v9, 24);

  v12 = objc_getProperty(self, v11, 16, 1);
  v14 = objc_getProperty(self, v13, 16, 1);
  objc_msgSend(v12, "subdataWithRange:", 4, objc_msgSend(v14, "length") - 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_setProperty_atomic(self, v16, v15, 32);
  return -[NEIKEv2KeyExchangePayload hasRequiredFields](self, "hasRequiredFields");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keData, 0);
  objc_storeStrong((id *)&self->_kem, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("KE");
}

@end
