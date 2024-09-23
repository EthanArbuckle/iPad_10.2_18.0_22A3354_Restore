@implementation IPStateUpdateMessage

- (IPStateUpdateMessage)initWithType:(unint64_t)a3 identity:(id)a4
{
  id v7;
  IPStateUpdateMessage *v8;
  IPStateUpdateMessage *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IPStateUpdateMessage;
  v8 = -[IPStateUpdateMessage init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_identity, a4);
  }

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p type: %u identity: %@>"), objc_opt_class(), self, self->_type, self->_identity);
}

- (id)XPCDictionaryRepresentation
{
  LSApplicationIdentity *identity;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  xpc_object_t v8;
  xpc_object_t v9;
  uint64_t i;
  id v12;
  xpc_object_t values[2];
  char *keys[3];

  keys[2] = *(char **)MEMORY[0x24BDAC8D0];
  identity = self->_identity;
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", identity, 1, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (!v4)
  {
    _IPDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[IPStateUpdateMessage XPCDictionaryRepresentation].cold.1((uint64_t)v5, v6);

  }
  keys[0] = (char *)objc_msgSend(CFSTR("type"), "UTF8String");
  keys[1] = (char *)objc_msgSend(CFSTR("data"), "UTF8String");
  values[0] = xpc_uint64_create(self->_type);
  if (v4)
  {
    v7 = objc_retainAutorelease(v4);
    v8 = xpc_data_create((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  }
  else
  {
    v8 = xpc_null_create();
  }
  values[1] = v8;
  v9 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
  for (i = 1; i != -1; --i)

  return v9;
}

- (IPStateUpdateMessage)initWithXPCDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t uint64;
  const void *data;
  void *v11;
  void *v12;
  id v13;
  IPStateUpdateMessage *v14;
  IPStateUpdateMessage *v15;
  id v17;
  size_t length;

  v6 = a3;
  if (MEMORY[0x242665FDC]() != MEMORY[0x24BDACFA0])
  {
    v7 = (void *)*MEMORY[0x24BDD0B88];
    v8 = 70;
LABEL_8:
    _IPMakeNSErrorImpl(v7, 4864, (uint64_t)"-[IPStateUpdateMessage initWithXPCDictionaryRepresentation:error:]", v8, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  uint64 = xpc_dictionary_get_uint64(v6, (const char *)objc_msgSend(CFSTR("type"), "UTF8String"));
  length = 0;
  data = xpc_dictionary_get_data(v6, (const char *)objc_msgSend(CFSTR("data"), "UTF8String"), &length);
  if (!uint64 || !data)
  {
    v7 = (void *)*MEMORY[0x24BDD0B88];
    v8 = 67;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;

  if (v12)
  {
    v14 = -[IPStateUpdateMessage initWithType:identity:](self, "initWithType:identity:", uint64, v12);
    goto LABEL_12;
  }
LABEL_9:

  if (a4)
  {
    v13 = objc_retainAutorelease(v13);
    v12 = 0;
    v14 = 0;
    *a4 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
LABEL_12:
  v15 = v14;

  return v15;
}

- (unint64_t)type
{
  return self->_type;
}

- (LSApplicationIdentity)identity
{
  return self->_identity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)XPCDictionaryRepresentation
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_23F108000, a2, OS_LOG_TYPE_FAULT, "Could not encode identity: %@", (uint8_t *)&v2, 0xCu);
}

@end
