@implementation NEIKEv2CertificatePayload

- (unint64_t)type
{
  return 37;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t encoding;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", objc_getProperty(self, v9, 32, 1), CFSTR("Certificate Data"), v5, a4);
    encoding = self->_encoding;
  }
  else
  {
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", 0, CFSTR("Certificate Data"), v5, a4);
    encoding = 0;
  }
  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", encoding, CFSTR("Encoding"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2CertificatePayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  NEIKEv2CertificatePayload *v2;
  id v3;

  v2 = self;
  if (self)
  {
    v3 = objc_getProperty(self, a2, 32, 1);
    if (v3)
    {
      LOBYTE(v2) = v2->_encoding != 0;

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
  id Property;
  id v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;
  NSObject *v12;
  char encoding;
  uint8_t buf[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
      goto LABEL_7;
    if (-[NEIKEv2CertificatePayload hasRequiredFields](self, "hasRequiredFields"))
    {
      encoding = self->_encoding;
      Property = objc_getProperty(self, v4, 32, 1);
LABEL_5:
      v6 = Property;
      v7 = objc_msgSend(v6, "length") + 1;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v7);
      objc_msgSend(v8, "appendBytes:length:", &encoding, 1);
      objc_msgSend(v8, "appendData:", v6);

      if (!self)
      {

        v10 = 0;
        return v10 != 0;
      }
      objc_setProperty_atomic(self, v9, v8, 16);

LABEL_7:
      v10 = objc_getProperty(self, v3, 16, 1);
      return v10 != 0;
    }
  }
  else if ((objc_msgSend(0, "hasRequiredFields") & 1) != 0)
  {
    Property = 0;
    encoding = 0;
    goto LABEL_5;
  }
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Certificate payload missing required fields", buf, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  const char *v4;
  SEL v5;
  id v6;
  SEL v7;
  id v8;
  void *v9;
  SEL v10;
  NSObject *v12;
  const char *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self || !objc_getProperty(self, a2, 16, 1))
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v14 = 136315138;
    v15 = "-[NEIKEv2CertificatePayload parsePayloadData]";
    v13 = "%s called with null self.payloadData";
LABEL_11:
    _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v13, (uint8_t *)&v14, 0xCu);
    goto LABEL_8;
  }
  if (objc_msgSend(objc_getProperty(self, v3, 16, 1), "length"))
  {
    LOBYTE(v14) = 0;
    objc_msgSend(objc_getProperty(self, v4, 16, 1), "getBytes:length:", &v14, 1);
    self->_encoding = v14;
    v6 = objc_getProperty(self, v5, 16, 1);
    v8 = objc_getProperty(self, v7, 16, 1);
    objc_msgSend(v6, "subdataWithRange:", 1, objc_msgSend(v8, "length") - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_setProperty_atomic(self, v10, v9, 32);
    return -[NEIKEv2CertificatePayload hasRequiredFields](self, "hasRequiredFields");
  }
  ne_log_obj();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    v14 = 136315138;
    v15 = "-[NEIKEv2CertificatePayload parsePayloadData]";
    v13 = "%s called with null (self.payloadData.length >= sizeof(ikev2_payload_cert_hdr_t))";
    goto LABEL_11;
  }
LABEL_8:

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateData, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("CERT");
}

@end
