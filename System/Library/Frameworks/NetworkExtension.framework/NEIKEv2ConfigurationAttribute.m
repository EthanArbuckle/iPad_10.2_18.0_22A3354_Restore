@implementation NEIKEv2ConfigurationAttribute

- (unint64_t)attributeType
{
  return 0;
}

- (unint64_t)valueType
{
  return 0;
}

- (id)initEmptyRequest
{
  NEIKEv2ConfigurationAttribute *v2;
  NEIKEv2ConfigurationAttribute *v3;
  NEIKEv2ConfigurationAttribute *v4;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NEIKEv2ConfigurationAttribute;
  v2 = -[NEIKEv2ConfigurationAttribute init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "[super init] failed", v7, 2u);
    }

  }
  return v3;
}

- (id)attributeName
{
  if (self)
    self = (NEIKEv2ConfigurationAttribute *)objc_getProperty(self, a2, 8, 1);
  return self;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  __CFString *String;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Name"), v5, a4);

  String = (__CFString *)NEIKEv2AttributeTypeCreateString(-[NEIKEv2ConfigurationAttribute attributeType](self, "attributeType"));
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", String, CFSTR("Type"), v5, a4);

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Payload Type"), v5, a4);

  return v7;
}

- (BOOL)validForChildlessSA
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customAttributeName, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Invalid");
}

@end
