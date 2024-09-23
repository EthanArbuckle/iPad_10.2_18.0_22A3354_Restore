@implementation NEProcessIdentity

- (id)initFromXPCConnection:(id)a3
{
  _xpc_connection_s *v4;
  NEProcessIdentity *v5;
  pid_t pid;
  NSData *v7;
  NSUUID *v8;
  NSUUID *v9;
  int v10;
  NSUUID *uuid;
  NSUUID *v12;
  NSData *auditTokenData;
  NEProcessIdentity *v14;
  NSObject *v15;
  objc_super v17;
  _OWORD buffer[3];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (_xpc_connection_s *)a3;
  v17.receiver = self;
  v17.super_class = (Class)NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v17, sel_init);
  if (!v5)
    goto LABEL_9;
  if (v4)
  {
    pid = xpc_connection_get_pid(v4);
    memset(buffer, 0, 32);
    xpc_connection_get_audit_token();
    v7 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buffer, 32);
    if (pid && (v19 = 0, memset(buffer, 0, sizeof(buffer)), proc_pidinfo(pid, 17, 1uLL, buffer, 56) == 56))
    {
      v8 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
      v9 = v8;
      v10 = buffer[2];
      if (LODWORD(buffer[2]) && v8 && v7)
      {
        v5->_pid = pid;
        v5->_pidVersion = v10;
        uuid = v5->_uuid;
        v5->_uuid = v8;
        v12 = v8;

        auditTokenData = v5->_auditTokenData;
        v5->_auditTokenData = v7;

LABEL_9:
        v14 = v5;
        goto LABEL_15;
      }
    }
    else
    {
      v10 = 0;
      v9 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
    pid = 0;
    v7 = 0;
  }
  ne_log_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buffer[0]) = 67109890;
    DWORD1(buffer[0]) = pid;
    WORD4(buffer[0]) = 1024;
    *(_DWORD *)((char *)buffer + 10) = v10;
    HIWORD(buffer[0]) = 2112;
    *(_QWORD *)&buffer[1] = v9;
    WORD4(buffer[1]) = 2112;
    *(_QWORD *)((char *)&buffer[1] + 10) = v7;
    _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Failed to derive the extension's identity data from xpc connection: %d, %d, %@, %@", (uint8_t *)buffer, 0x22u);
  }

  v14 = 0;
LABEL_15:

  return v14;
}

- (id)initFromXPCMessage:(id)a3
{
  id v4;
  NEProcessIdentity *v5;
  int v6;
  NSUUID *v7;
  int v8;
  NSData *v9;
  NSObject *v10;
  NEProcessIdentity *v11;
  NSUUID *v12;
  NSUUID *uuid;
  NSUUID *v14;
  NSData *auditTokenData;
  objc_super v17;
  _OWORD buffer[3];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v17, sel_init);
  if (!v5)
    goto LABEL_14;
  if (v4 && MEMORY[0x1A1ACFDA4](v4) == MEMORY[0x1E0C812F8])
  {
    memset(buffer, 0, 32);
    xpc_dictionary_get_audit_token();
    v9 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", buffer, 32);
    v8 = DWORD1(buffer[1]);
    if (!DWORD1(buffer[1])
      || (v19 = 0, memset(buffer, 0, sizeof(buffer)), proc_pidinfo(v8, 17, 1uLL, buffer, 56) != 56))
    {
      v6 = 0;
      v7 = 0;
      goto LABEL_5;
    }
    v12 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", buffer);
    v7 = v12;
    v6 = buffer[2];
    if (!LODWORD(buffer[2]) || !v12 || !v9)
      goto LABEL_5;
    v5->_pid = v8;
    v5->_pidVersion = v6;
    uuid = v5->_uuid;
    v5->_uuid = v12;
    v14 = v12;

    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = v9;

LABEL_14:
    v11 = v5;
    goto LABEL_15;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
LABEL_5:
  ne_log_obj();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buffer[0]) = 67109890;
    DWORD1(buffer[0]) = v8;
    WORD4(buffer[0]) = 1024;
    *(_DWORD *)((char *)buffer + 10) = v6;
    HIWORD(buffer[0]) = 2112;
    *(_QWORD *)&buffer[1] = v7;
    WORD4(buffer[1]) = 2112;
    *(_QWORD *)((char *)&buffer[1] + 10) = v9;
    _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Failed to derive the extension's identity data from xpc message: %d, %d, %@, %@", (uint8_t *)buffer, 0x22u);
  }

  v11 = 0;
LABEL_15:

  return v11;
}

- (NEProcessIdentity)initWithCoder:(id)a3
{
  id v4;
  NEProcessIdentity *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *auditTokenData;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NEProcessIdentity;
  v5 = -[NEProcessIdentity init](&v11, sel_init);
  if (v5)
  {
    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("pid"));
    v5->_pidVersion = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("pidVersion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    auditTokenData = v5->_auditTokenData;
    v5->_auditTokenData = (NSData *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[NEProcessIdentity pid](self, "pid"), CFSTR("pid"));
  objc_msgSend(v4, "encodeInt32:forKey:", -[NEProcessIdentity pidVersion](self, "pidVersion"), CFSTR("pidVersion"));
  -[NEProcessIdentity uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("uuid"));

  -[NEProcessIdentity auditTokenData](self, "auditTokenData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("auditToken"));

}

- (int)pid
{
  return self->_pid;
}

- (int)pidVersion
{
  return self->_pidVersion;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
