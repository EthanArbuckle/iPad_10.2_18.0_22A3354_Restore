@implementation NEIKEv2CustomPayload

- (unint64_t)type
{
  if (self)
    return *(_QWORD *)(self + 24);
  return self;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  SEL v9;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (self)
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", self->_customType, CFSTR("Custom Type"), v5, a4);
    Property = objc_getProperty(self, v9, 32, 1);
  }
  else
  {
    objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", 0, CFSTR("Custom Type"), v5, a4);
    Property = 0;
  }
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Custom Data"), v5, a4);
  return v7;
}

- (BOOL)hasRequiredFields
{
  if (self)
  {
    if (self->_customType)
      LOBYTE(self) = objc_getProperty(self, a2, 32, 1) != 0;
    else
      LOBYTE(self) = 0;
  }
  return (char)self;
}

- (BOOL)generatePayloadData
{
  const char *v3;
  const char *v4;
  id v5;
  SEL v6;
  id Property;
  char v9;
  NSObject *v10;
  uint8_t v11[16];

  if (self)
  {
    if (objc_getProperty(self, a2, 16, 1))
    {
LABEL_5:
      Property = objc_getProperty(self, v3, 16, 1);
      return Property != 0;
    }
    if (-[NEIKEv2CustomPayload hasRequiredFields](self, "hasRequiredFields"))
    {
      v5 = objc_getProperty(self, v4, 32, 1);
      objc_setProperty_atomic(self, v6, v5, 16);

      goto LABEL_5;
    }
  }
  else
  {
    v9 = objc_msgSend(0, "hasRequiredFields");
    Property = 0;
    if ((v9 & 1) != 0)
      return Property != 0;
  }
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Custom payload missing required fields", v11, 2u);
  }

  return 0;
}

- (BOOL)parsePayloadData
{
  const char *v3;
  id v4;
  SEL v5;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self && objc_getProperty(self, a2, 16, 1))
  {
    v4 = objc_getProperty(self, v3, 16, 1);
    objc_setProperty_atomic(self, v5, v4, 32);

    return -[NEIKEv2CustomPayload hasRequiredFields](self, "hasRequiredFields");
  }
  else
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315138;
      v9 = "-[NEIKEv2CustomPayload parsePayloadData]";
      _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, "%s called with null self.payloadData", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customData, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Custom");
}

@end
