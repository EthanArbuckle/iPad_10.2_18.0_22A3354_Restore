@implementation NEIKEv2GSPMPayload

- (unint64_t)type
{
  return 49;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  NSData *gspmData;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
    gspmData = self->_gspmData;
  else
    gspmData = 0;
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", gspmData, CFSTR("GSPM Data"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2GSPMPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (BOOL)hasRequiredFields
{
  NSData *gspmData;

  if (self)
    gspmData = self->_gspmData;
  else
    gspmData = 0;
  return gspmData != 0;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  NSData *v4;
  SEL v5;
  id Property;
  char v8;
  NSObject *v9;
  uint8_t v10[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
    {
LABEL_5:
      Property = objc_getProperty(self, v3, 16, 1);
      return Property != 0;
    }
    if (-[NEIKEv2GSPMPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v4 = self->_gspmData;
      objc_setProperty_atomic(self, v5, v4, 16);

      goto LABEL_5;
    }
  }
  else
  {
    v8 = objc_msgSend(0, "hasRequiredFields");
    Property = 0;
    if ((v8 & 1) != 0)
      return Property != 0;
  }
  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "GSPM payload missing required fields", v10, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  id Property;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    Property = objc_getProperty(self, v3, 16, 1);
    objc_storeStrong((id *)&self->_gspmData, Property);
    return -[NEIKEv2GSPMPayload hasRequiredFields](self, "hasRequiredFields");
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315138;
      v8 = "-[NEIKEv2GSPMPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gspmData, 0);
}

- (void)setGspmData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

+ (id)copyTypeDescription
{
  return CFSTR("GSPM");
}

@end
