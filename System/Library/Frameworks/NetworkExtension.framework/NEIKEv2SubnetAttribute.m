@implementation NEIKEv2SubnetAttribute

- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 prefix:(unsigned __int8)a4
{
  id v6;
  NEIKEv2SubnetAttribute *v7;
  const char *v8;
  NEIKEv2SubnetAttribute *v9;
  SEL v10;
  NEIKEv2SubnetAttribute *v11;
  NSObject *v13;
  uint8_t v14[16];
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEIKEv2SubnetAttribute;
  v7 = -[NEIKEv2SubnetAttribute init](&v15, sel_init);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 24);
    objc_setProperty_atomic(v9, v10, CFSTR("AssignedSubnet"), 8);
    v9->_prefix = a4;
    v11 = v9;
  }
  else
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "[super init] failed", v14, 2u);
    }

  }
  return v9;
}

- (NEIKEv2SubnetAttribute)initWithAddress:(id)a3 ipv4SubnetMask:(unsigned int)a4
{
  id v6;
  NEIKEv2SubnetAttribute *v7;
  const char *v8;
  NEIKEv2SubnetAttribute *v9;
  SEL v10;
  uint64_t v11;
  char v12;
  int v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  NEIKEv2SubnetAttribute *v20;
  NSObject *v22;
  __int16 v23;
  objc_super v24;
  unsigned int v25;

  v6 = a3;
  v25 = a4;
  v24.receiver = self;
  v24.super_class = (Class)NEIKEv2SubnetAttribute;
  v7 = -[NEIKEv2SubnetAttribute init](&v24, sel_init);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, v6, 24);
    objc_setProperty_atomic(v9, v10, CFSTR("AssignedSubnet"), 8);
    v11 = 0;
    v12 = 0;
    v9->_ipv4SubnetMask = a4;
    while (1)
    {
      v13 = *((unsigned __int8 *)&v25 + v11);
      if (v13 != 255)
        break;
      v12 += 8;
      if (++v11 == 4)
      {
        v12 = 32;
        goto LABEL_24;
      }
    }
    v14 = v12 | 6;
    v15 = v12 | 7;
    if (v13 != 254)
      v15 = v12;
    if (v13 != 252)
      v14 = v15;
    v16 = v12 | 4;
    v17 = v12 | 5;
    if (v13 != 248)
      v17 = v12;
    if (v13 != 240)
      v16 = v17;
    if (v13 <= 251)
      v14 = v16;
    v18 = v12 | 1;
    v19 = v12 | 2;
    if (v13 == 224)
      v12 |= 3u;
    if (v13 == 192)
      v12 = v19;
    if (v13 == 128)
      v12 = v18;
    if (v13 > 239)
      v12 = v14;
LABEL_24:
    v9->_prefix = v12;
    v20 = v9;
  }
  else
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = 0;
      _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)&v23, 2u);
    }

  }
  return v9;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 prefix:(unsigned __int8)a6
{
  id v10;
  id v11;
  NEIKEv2SubnetAttribute *v12;
  const char *v13;
  NEIKEv2SubnetAttribute *v14;
  SEL v15;
  NEIKEv2SubnetAttribute *v16;
  NSObject *v18;
  __int16 v19[8];
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NEIKEv2SubnetAttribute;
  v12 = -[NEIKEv2SubnetAttribute init](&v20, sel_init);
  v14 = v12;
  if (v12)
  {
    v12->_customType = a3;
    objc_setProperty_atomic(v12, v13, v10, 8);
    objc_setProperty_atomic(v14, v15, v11, 24);
    v14->_prefix = a6;
    v16 = v14;
  }
  else
  {
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v19[0] = 0;
      _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", (uint8_t *)v19, 2u);
    }

  }
  return v14;
}

- (id)initCustomWithAttributeType:(unint64_t)a3 attributeName:(id)a4 addressValue:(id)a5 ipv4SubnetMask:(unsigned int)a6
{
  uint64_t v6;
  id v10;
  NEIKEv2SubnetAttribute *v11;
  const char *v12;
  NEIKEv2SubnetAttribute *v13;

  v6 = *(_QWORD *)&a6;
  v10 = a4;
  v11 = -[NEIKEv2SubnetAttribute initWithAddress:ipv4SubnetMask:](self, "initWithAddress:ipv4SubnetMask:", a5, v6);
  v13 = v11;
  if (v11)
  {
    v11->_customType = a3;
    objc_setProperty_atomic(v11, v12, v10, 8);
  }

  return v13;
}

- (unint64_t)attributeType
{
  if (self)
    return *(_QWORD *)(self + 32);
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

  String = (__CFString *)NEIKEv2AttributeTypeCreateString(-[NEIKEv2SubnetAttribute attributeType](self, "attributeType"));
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", String, CFSTR("Type"), v5, a4);

  v10 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v10, CFSTR("Payload Type"), v5, a4);

  -[NEIKEv2SubnetAttribute address](self, "address");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v11, CFSTR("Address"), v5, a4);

  objc_msgSend(v7, "appendPrettyInt:withName:andIndent:options:", -[NEIKEv2SubnetAttribute prefix](self, "prefix"), CFSTR("Prefix"), v5, a4);
  return v7;
}

- (id)description
{
  return -[NEIKEv2SubnetAttribute descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (NWAddressEndpoint)subnetMaskAddress
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  CFStringRef v7;
  __CFString *v8;
  void *v9;

  -[NEIKEv2SubnetAttribute address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addressFamily");

  v5 = (void *)MEMORY[0x1E0CCEC58];
  v6 = -[NEIKEv2SubnetAttribute prefix](self, "prefix");
  if (v4 == 2)
    v7 = NECreateIPv4AddressMaskStringFromPrefix(v6);
  else
    v7 = NECreateIPv6AddressMaskStringFromPrefix(v6);
  v8 = (__CFString *)v7;
  objc_msgSend(v5, "endpointWithHostname:port:", v7, CFSTR("0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NWAddressEndpoint *)v9;
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
  v5 = -[NEIKEv2SubnetAttribute attributeType](self, "attributeType");
  -[NEIKEv2ConfigurationAttribute attributeName](self, "attributeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2SubnetAttribute address](self, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)objc_msgSend(v4, "initCustomWithAttributeType:attributeName:addressValue:prefix:", v5, v6, v8, -[NEIKEv2SubnetAttribute prefix](self, "prefix"));

  return v9;
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)prefix
{
  return self->_prefix;
}

- (unsigned)ipv4SubnetMask
{
  return self->_ipv4SubnetMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Subnet");
}

@end
