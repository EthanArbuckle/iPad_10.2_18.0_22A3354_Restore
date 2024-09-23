@implementation NEIKEv2EncryptedPayload

- (unint64_t)type
{
  return 46;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v7 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v6, "appendPrettyObject:withName:andIndent:options:", v7, CFSTR("Payload Type"), v5, a4);

  return v6;
}

- (id)description
{
  return -[NEIKEv2EncryptedPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  if (self)
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16, 1);
  return self != 0;
}

- (BOOL)generatePayloadData
{
  if (self)
    self = (NEIKEv2EncryptedPayload *)objc_getProperty(self, a2, 16, 1);
  return self != 0;
}

- (BOOL)parsePayloadData
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
    return -[NEIKEv2EncryptedPayload hasRequiredFields](self, "hasRequiredFields");
  ne_log_obj();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v5 = 136315138;
    v6 = "-[NEIKEv2EncryptedPayload parsePayloadData]";
    _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v5, 0xCu);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticatedHeaders, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Encrypted");
}

@end
