@implementation ClientIdentity

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[2].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (int)pid
{
  return self->_pid;
}

- (ClientIdentity)initWithAuditToken:(id *)a3
{
  ClientIdentity *v4;
  ClientIdentity *v5;
  __int128 v6;
  __int128 v7;
  pid_t v8;
  uint64_t v9;
  NSString *clientName;
  __int128 v11;
  __int128 v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSString *teamIdentifier;
  uint64_t v17;
  NSString *localizedName;
  uint64_t v19;
  NSString *bundleIdentifierShared;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int pid;
  NSObject *v32;
  int v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  int v37;
  id v39[2];
  pid_t pidp;
  objc_super v41;
  uint8_t buf[4];
  pid_t v43;
  __int128 buffer;
  __int128 v45;
  audit_token_t atoken;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)ClientIdentity;
  v4 = -[ClientIdentity init](&v41, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)v4->_auditToken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&v4->_auditToken.val[4] = v6;
    pidp = -1;
    v7 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&atoken.val[4] = v7;
    audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
    v8 = pidp;
    v5->_pid = pidp;
    LOBYTE(atoken.val[0]) = 0;
    proc_name(v8, &atoken, 0x400u);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", &atoken, 4);
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v9;

    v39[1] = 0;
    v11 = *(_OWORD *)&a3->var0[4];
    buffer = *(_OWORD *)a3->var0;
    v45 = v11;
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    v39[0] = 0;
    v12 = *(_OWORD *)&a3->var0[4];
    buffer = *(_OWORD *)a3->var0;
    v45 = v12;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", &buffer, v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v39[0];
    objc_msgSend(v13, "teamIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v15;

    objc_msgSend(v13, "localizedName");
    v17 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v17;

    objc_msgSend(v13, "bundleIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    bundleIdentifierShared = v5->_bundleIdentifierShared;
    v5->_bundleIdentifierShared = (NSString *)v19;

    if (!v5->_bundleIdentifierShared)
    {
      bzero(&buffer, 0x400uLL);
      v21 = proc_pidpath(pidp, &buffer, 0x400u);
      if (v21 <= 0)
      {
        v28 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v43 = pidp;
          _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_ERROR, "Could not find path of process with PID: [%d]", buf, 8u);
        }
      }
      else
      {
        v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", &buffer, v21, 4);
        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)_CFBundleCopyBundleURLForExecutableURL();
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "bundleIdentifier");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = v5->_bundleIdentifierShared;
          v5->_bundleIdentifierShared = (NSString *)v26;

        }
        else
        {
          v29 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            v43 = pidp;
            _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_ERROR, "Could not generate path string for process with pid: [%d]", buf, 8u);
          }
        }

      }
      if (!v5->_bundleIdentifierShared)
      {
        v30 = CADLogHandle;
        if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
        {
          pid = v5->_pid;
          LODWORD(buffer) = 67109120;
          DWORD1(buffer) = pid;
          _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_DEBUG, "Could not get bundle identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
        }
      }
    }
    if (!v5->_teamIdentifier)
    {
      v32 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v33 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v33;
        _os_log_impl(&dword_1B6A18000, v32, OS_LOG_TYPE_DEBUG, "Could not get team identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }
    if (!v5->_localizedName)
    {
      v34 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v35 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v35;
        _os_log_impl(&dword_1B6A18000, v34, OS_LOG_TYPE_DEBUG, "Could not get localized name for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }
    if (!v5->_applicationIdentifier)
    {
      v36 = CADLogHandle;
      if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
      {
        v37 = v5->_pid;
        LODWORD(buffer) = 67109120;
        DWORD1(buffer) = v37;
        _os_log_impl(&dword_1B6A18000, v36, OS_LOG_TYPE_DEBUG, "Could not get application identifier for client (pid %d).", (uint8_t *)&buffer, 8u);
      }
    }

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codeSigningIdentity, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierShared, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifierShared;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_auditToken, 32, CFSTR("auditToken"));
}

- (ClientIdentity)initWithCoder:(id)a3
{
  __int128 *v4;
  __int128 v5;
  ClientIdentity *v6;
  _OWORD v8[2];
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v4 = (__int128 *)objc_msgSend(objc_retainAutorelease(a3), "decodeBytesForKey:returnedLength:", CFSTR("auditToken"), &v9);
  if (v9 == 32)
  {
    v5 = v4[1];
    v10 = *v4;
    v11 = v5;
    v8[0] = v10;
    v8[1] = v5;
    self = -[ClientIdentity initWithAuditToken:](self, "initWithAuditToken:", v8);
    v6 = self;
  }
  else
  {
    NSLog(CFSTR("Error: Invalid audit token length."));
    v6 = 0;
  }

  return v6;
}

- (NSString)untrustedBundleIdentifier
{
  return self->_bundleIdentifierShared;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  BOOL v10;
  _OWORD v12[4];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ClientIdentity auditToken](self, "auditToken");
    memset(v12, 0, sizeof(v12));
    if (v5)
      objc_msgSend(v5, "auditToken");
    if (LODWORD(v12[2]) == LODWORD(v12[0]))
    {
      v6 = 0;
      do
      {
        v7 = v6;
        if (v6 == 7)
          break;
        v8 = *((_DWORD *)&v12[2] + v6 + 1);
        v9 = *((_DWORD *)v12 + ++v6);
      }
      while (v8 == v9);
      v10 = v7 > 6;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v11.receiver = self;
  v11.super_class = (Class)ClientIdentity;
  -[ClientIdentity description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withString:", CFSTR("bundleIdentifier"), self->_bundleIdentifierShared);
  -[ClientIdentity applicationIdentifier](self, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("applicationIdentifier"), v6);

  -[ClientIdentity teamIdentifier](self, "teamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("teamIdentifier"), v7);

  -[ClientIdentity clientName](self, "clientName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKey:withString:", CFSTR("clientName"), v8);

  objc_msgSend(v5, "setKey:withProcessID:", CFSTR("pid"), -[ClientIdentity pid](self, "pid"));
  objc_msgSend(v5, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)codeSigningIdentity
{
  return self->_codeSigningIdentity;
}

@end
