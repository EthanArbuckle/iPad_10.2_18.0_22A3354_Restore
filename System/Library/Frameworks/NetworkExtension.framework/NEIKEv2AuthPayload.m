@implementation NEIKEv2AuthPayload

- (unint64_t)type
{
  return 39;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  NSData *authenticationData;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", self->_authProtocol, CFSTR("Authentication Protocol"), v5, a4);
    authenticationData = self->_authenticationData;
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Authentication Protocol"), v5, a4);
    authenticationData = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", authenticationData, CFSTR("Authentication Data"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2AuthPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  NEIKEv2AuthPayload *v2;
  NSData *v3;
  NSData *v4;
  NEIKEv2AuthenticationProtocol *authProtocol;
  NEIKEv2AuthenticationProtocol *v6;

  v2 = self;
  if (self)
  {
    v3 = self->_authenticationData;
    if (v3)
    {
      v4 = v3;
      authProtocol = v2->_authProtocol;
      if (authProtocol)
      {
        v6 = authProtocol;
        LOBYTE(v2) = -[NEIKEv2AuthenticationProtocol method](v6, "method") != 0;

      }
      else
      {
        LOBYTE(v2) = 0;
      }

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
  char v4;
  NSData *authenticationData;
  NSData *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id Property;
  NSObject *v12;
  int v13;
  uint8_t buf[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      goto LABEL_7;
    if (-[NEIKEv2AuthPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v13 = 0;
      v4 = -[NEIKEv2AuthenticationProtocol method](self->_authProtocol, "method");
      authenticationData = self->_authenticationData;
LABEL_5:
      LOBYTE(v13) = v4;
      v6 = authenticationData;
      v7 = -[NSData length](v6, "length") + 4;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v7);
      objc_msgSend(v8, "appendBytes:length:", &v13, 4);
      objc_msgSend(v8, "appendData:", v6);

      if (!self)
      {

        Property = 0;
        return Property != 0;
      }
      objc_setProperty_atomic(self, v9, v8, 16);

LABEL_7:
      Property = objc_getProperty(self, v3, 16, 1);
      return Property != 0;
    }
  }
  else if ((objc_msgSend(0, "hasRequiredFields") & 1) != 0)
  {
    v4 = 0;
    authenticationData = 0;
    v13 = 0;
    goto LABEL_5;
  }
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Auth payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  SEL v7;
  const char *v8;
  __CFString *String;
  const char *v10;
  id v11;
  SEL v12;
  id v13;
  void *v14;
  NEIKEv2AuthenticationProtocol *v15;
  int v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    v17 = 0;
    if ((unint64_t)objc_msgSend(objc_getProperty(self, v3, 16, 1), "length") > 3)
    {
      objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v17, 4);
      if (objc_msgSend(objc_getProperty(self, v7, 16, 1), "length") == 4)
      {
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        String = (__CFString *)NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Auth payload with method %@ does not have any data";
      }
      else
      {
        v11 = objc_getProperty(self, v8, 16, 1);
        v13 = objc_getProperty(self, v12, 16, 1);
        objc_msgSend(v11, "subdataWithRange:", 4, objc_msgSend(v13, "length") - 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[NEIKEv2AuthPayload setAuthenticationData:]((uint64_t)self, v14);
        v15 = +[NEIKEv2Crypto copyAuthenticationProtocolForAuthMethod:authData:]((uint64_t)NEIKEv2Crypto, v17, self->_authenticationData);
        objc_storeStrong((id *)&self->_authProtocol, v15);

        if (self->_authProtocol)
          return -[NEIKEv2AuthPayload hasRequiredFields](self, "hasRequiredFields");
        ne_log_obj();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        String = (__CFString *)NEIKEv2AuthenticationMethodCreateString(v17);
        *(_DWORD *)buf = 138412290;
        v19 = (const char *)String;
        v10 = "Failed to parse authentication protocol for method %@";
      }
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);

      goto LABEL_15;
    }
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null (self.payloadData.length >= sizeof(header))";
LABEL_8:
      _os_log_fault_impl(&dword_19BD16000, v5, OS_LOG_TYPE_FAULT, v6, buf, 0xCu);
    }
  }
  else
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NEIKEv2AuthPayload parsePayloadData]";
      v6 = "%s called with null self.payloadData";
      goto LABEL_8;
    }
  }
LABEL_15:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationData, 0);
  objc_storeStrong((id *)&self->_authProtocol, 0);
}

- (void)setAuthenticationData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setAuthProtocol:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

+ (id)copyTypeDescription
{
  return CFSTR("Auth");
}

@end
