@implementation NEIKEv2AddressAttribute

- (NEIKEv2AddressAttribute)initWithAddress:(id)a3
{
  id v4;
  NEIKEv2AddressAttribute *v5;
  const char *v6;
  NEIKEv2AddressAttribute *v7;
  SEL v8;
  NEIKEv2AddressAttribute *v9;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NEIKEv2AddressAttribute;
  v5 = -[NEIKEv2AddressAttribute init](&v13, sel_init);
  v7 = v5;
  if (v5)
  {
    objc_setProperty_atomic(v5, v6, CFSTR("AssignedAddress"), 8);
    objc_setProperty_atomic(v7, v8, v4, 16);
    v9 = v7;
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_fault_impl(&dword_19BD16000, v11, OS_LOG_TYPE_FAULT, "[super init] failed", v12, 2u);
    }

  }
  return v7;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5
{
  id v8;
  id v9;
  NEIKEv2AddressAttribute *v10;
  const char *v11;
  NEIKEv2AddressAttribute *v12;
  SEL v13;
  NEIKEv2AddressAttribute *v14;
  NSObject *v16;
  __int16 v17[8];
  objc_super v18;

  v8 = a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)NEIKEv2AddressAttribute;
  v10 = -[NEIKEv2AddressAttribute init](&v18, sel_init);
  v12 = v10;
  if (v10)
  {
    v10->_customType = a3;
    objc_setProperty_atomic(v10, v11, v8, 8);
    objc_setProperty_atomic(v12, v13, v9, 16);
    v14 = v12;
  }
  else
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v17[0] = 0;
      _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v17, 2u);
    }

  }
  return v12;
}

- (unint64_t)attributeType
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
  __CFString *String;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Name"), v5, a4);

  String = (__CFString *)NEIKEv2AttributeTypeCreateString(-[NEIKEv2AddressAttribute attributeType](self, "attributeType"));
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", String, CFSTR("Type"), v5, a4);

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Payload Type"), v5, a4);

  -[NEIKEv2AddressAttribute address](self, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Address"), v5, a4);

  return v7;
}

- (id)description
{
  return -[NEIKEv2AddressAttribute descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = -[NEIKEv2AddressAttribute attributeType](self, "attributeType");
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2AddressAttribute address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)objc_msgSend(v4, "initCustomWithAttributeType:attributeName:addressValue:", v5, v6, v8);

  return v9;
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Address");
}

@end
