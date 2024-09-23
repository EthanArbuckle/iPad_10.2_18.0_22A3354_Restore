@implementation NEIKEv2ConfigurationMessage

- (NEIKEv2ConfigurationMessage)initWithWithAttributes:(id)a3
{
  id v4;
  NEIKEv2ConfigurationMessage *v5;
  const char *v6;
  NEIKEv2ConfigurationMessage *v7;
  NEIKEv2ConfigurationMessage *v8;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NEIKEv2ConfigurationMessage;
  v5 = -[NEIKEv2ConfigurationMessage init](&v12, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic(v5, v6, v4, 16);
    v8 = v7;
  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }

  }
  return v7;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  unint64_t v9;
  __CFString *v10;
  const char *v11;
  id v12;
  unint64_t configurationType;
  id Property;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = v7;
  if (self)
  {
    v9 = self->_configurationType - 1;
    if (v9 < 4)
    {
      v10 = off_1E3CC0D88[v9];
      objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Type"), v5, a4);
      goto LABEL_6;
    }
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    configurationType = self->_configurationType;
  }
  else
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    configurationType = 0;
  }
  v10 = (__CFString *)objc_msgSend(v12, "initWithFormat:", CFSTR("%u"), configurationType);
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Type"), v5, a4);
  if (!self)
  {
    Property = 0;
    goto LABEL_7;
  }
LABEL_6:
  Property = objc_getProperty(self, v11, 16, 1);
LABEL_7:
  objc_msgSend(v8, "appendPrettyObject:withName:andIndent:options:", Property, CFSTR("Attributes"), v5, a4);

  return v8;
}

- (id)description
{
  return -[NEIKEv2ConfigurationMessage descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  void *v5;
  unint64_t configurationType;
  const char *v7;
  id v8;
  id Property;
  const char *v10;
  void *v11;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  if (self)
  {
    configurationType = self->_configurationType;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  configurationType = 0;
  if (v4)
LABEL_3:
    *(_QWORD *)(v4 + 8) = configurationType;
LABEL_4:
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  if (self)
    Property = objc_getProperty(self, v7, 16, 1);
  else
    Property = 0;
  v11 = (void *)objc_msgSend(v8, "initWithArray:copyItems:", Property, 1);
  if (v5)
    objc_setProperty_atomic(v5, v10, v11, 16);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
