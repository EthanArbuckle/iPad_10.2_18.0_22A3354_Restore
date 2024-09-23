@implementation BLSAssertionIdentifier

+ (unint64_t)nextCount
{
  unint64_t result;

  do
    result = __ldxr(&nextCount___count);
  while (__stxr(result + 1, &nextCount___count));
  return result;
}

- (BLSAssertionIdentifier)initWithClientPid:(int)a3 hostPid:(int)a4 count:(unint64_t)a5
{
  BLSAssertionIdentifier *v7;
  BLSAssertionIdentifier *v9;
  BLSAssertionIdentifier *v10;
  NSObject *v11;
  objc_super v13;

  v7 = self;
  if (a3 < 1 || a4 <= 0)
  {
    bls_assertions_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BLSAssertionIdentifier initWithClientPid:hostPid:count:].cold.1(a3, a4, v11);

    v10 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BLSAssertionIdentifier;
    v9 = -[BLSAssertionIdentifier init](&v13, sel_init);
    if (v9)
    {
      v9->_hostPid = a4;
      v9->_clientPid = a3;
      v9->_count = a5;
    }
    v7 = v9;
    v10 = v7;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", self->_clientPid, CFSTR("clientPid"));
  v5 = (id)objc_msgSend(v3, "appendInt:withName:", self->_hostPid, CFSTR("hostPid"));
  v6 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_count, CFSTR("count"));
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_clientPid);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_hostPid);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_count);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", HIDWORD(self->_count));
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  BLSAssertionIdentifier *v4;
  BLSAssertionIdentifier *v5;
  int clientPid;
  int hostPid;
  unint64_t count;
  BOOL v9;

  v4 = (BLSAssertionIdentifier *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      clientPid = self->_clientPid;
      if (clientPid == -[BLSAssertionIdentifier clientPid](v5, "clientPid")
        && (hostPid = self->_hostPid, hostPid == -[BLSAssertionIdentifier hostPid](v5, "hostPid")))
      {
        count = self->_count;
        v9 = count == -[BLSAssertionIdentifier count](v5, "count");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BLSAssertionIdentifier)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t uint64;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("clientPid"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("hostPid"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("count"), "UTF8String");
  uint64 = xpc_dictionary_get_uint64(v4, v5);
  v9 = xpc_dictionary_get_uint64(v4, v6);
  v10 = xpc_dictionary_get_uint64(v4, v7);

  return -[BLSAssertionIdentifier initWithClientPid:hostPid:count:](self, "initWithClientPid:hostPid:count:", uint64, v9, v10);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  const char *v5;
  const char *v6;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("clientPid"), "UTF8String");
  v5 = (const char *)objc_msgSend(CFSTR("hostPid"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("count"), "UTF8String");
  xpc_dictionary_set_uint64(xdict, v4, self->_clientPid);
  xpc_dictionary_set_uint64(xdict, v5, self->_hostPid);
  xpc_dictionary_set_uint64(xdict, v6, self->_count);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSAssertionIdentifier)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("clientPid"));
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("hostPid"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("count"));

  return -[BLSAssertionIdentifier initWithClientPid:hostPid:count:](self, "initWithClientPid:hostPid:count:", v5, v6, v7);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t clientPid;
  id v5;

  clientPid = self->_clientPid;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", clientPid, CFSTR("clientPid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_hostPid, CFSTR("hostPid"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_count, CFSTR("count"));

}

- (int)hostPid
{
  return self->_hostPid;
}

- (int)clientPid
{
  return self->_clientPid;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)initWithClientPid:(int)a1 hostPid:(int)a2 count:(os_log_t)log .cold.1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "BLSAssertionIdentifier initialized with invalid clientPid:%d hostPid:%d", (uint8_t *)v3, 0xEu);
}

@end
