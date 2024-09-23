@implementation _GCIPCRemoteProcess

- (_GCIPCRemoteProcess)initWithConnection:(id)a3
{
  id v4;
  _GCIPCRemoteProcess *v5;
  _GCIPCRemoteProcess *v6;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_auditToken;
  uint64_t v8;
  NSArray *connections;
  uint64_t v10;
  NSMutableSet *connectionInvalidationRegistrations;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCIPCRemoteProcess;
  v5 = -[_GCIPCRemoteProcess init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    p_auditToken = &v5->_auditToken;
    if (v4)
    {
      objc_msgSend(v4, "auditToken");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
    *(_OWORD *)p_auditToken->val = v13;
    *(_OWORD *)&v6->_auditToken.val[4] = v14;
    v6->_auditSessionIdentifier = objc_msgSend(v4, "auditSessionIdentifier", v13, v14);
    v6->_processIdentifier = objc_msgSend(v4, "processIdentifier");
    v6->_effectiveUserIdentifier = objc_msgSend(v4, "effectiveUserIdentifier");
    v6->_effectiveGroupIdentifier = objc_msgSend(v4, "effectiveGroupIdentifier");
    v8 = objc_opt_new();
    connections = v6->_connections;
    v6->_connections = (NSArray *)v8;

    v10 = objc_opt_new();
    connectionInvalidationRegistrations = v6->_connectionInvalidationRegistrations;
    v6->_connectionInvalidationRegistrations = (NSMutableSet *)v10;

    -[_GCIPCRemoteProcess populateBundleIdentifierForConnection:](v6, "populateBundleIdentifierForConnection:", v4);
  }

  return v6;
}

- (_GCIPCRemoteProcess)init
{
  -[_GCIPCRemoteProcess doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)populateBundleIdentifierForConnection:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;
  id v6;

  objc_msgSend(a3, "processIdentifier");
  GCBundleWithPID();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (void)addConnection:(id)a3
{
  id v5;
  _GCIPCRemoteProcess *v6;
  void *v7;
  _GCIPCRemoteProcess *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  _GCIPCRemoteProcess *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "process");
  v6 = (_GCIPCRemoteProcess *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v8 = self;
    objc_sync_enter(v8);
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v19 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __37___GCIPCRemoteProcess_addConnection___block_invoke;
    v15[3] = &unk_24D2B3CA8;
    v15[4] = v8;
    v15[5] = &v16;
    v15[6] = v5;
    v15[7] = a2;
    objc_msgSend(v5, "addInvalidationHandler:", v15);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v17[3] = v9;
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v8;
          v22 = 2112;
          v23 = v5;
          _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "%@ adding connection: %@", buf, 0x16u);
        }

      }
      -[_GCIPCRemoteProcess connections](v8, "connections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GCIPCRemoteProcess setConnections:](v8, "setConnections:", v12);

      -[_GCIPCRemoteProcess connectionInvalidationRegistrations](v8, "connectionInvalidationRegistrations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v10);

    }
    _Block_object_dispose(&v16, 8);
    objc_sync_exit(v8);

  }
  else
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCIPCProcess.m"), 67, CFSTR("Connection %@ is not from process %@"), v5, self);

  }
}

- (BOOL)isEqualToProcess:(id)a3
{
  id v4;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[_GCIPCRemoteProcess auditToken](self, "auditToken");
  if (v4)
  {
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
  }
  v8 = v12 == (_QWORD)v10 && v13 == *((_QWORD *)&v10 + 1) && v14 == (_QWORD)v11 && v15 == *((_QWORD *)&v11 + 1);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_GCIPCRemoteProcess isEqualToProcess:](self, "isEqualToProcess:", v4);

  return v5;
}

- (unint64_t)hash
{
  return -[_GCIPCRemoteProcess processIdentifier](self, "processIdentifier");
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ pid: %i>"), objc_opt_class(), -[_GCIPCRemoteProcess processIdentifier](self, "processIdentifier"));
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ pid: %i>"), objc_opt_class(), -[_GCIPCRemoteProcess processIdentifier](self, "processIdentifier"));
}

- (id)debugDescription
{
  objc_class *v3;
  void *v4;
  void *v5;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSString stringWithFormat:](&off_254DEDEA8, "stringWithFormat:", CFSTR("<%@ %p pid: %i>"), v4, self, -[_GCIPCRemoteProcess processIdentifier](self, "processIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (int)auditSessionIdentifier
{
  return self->_auditSessionIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (unsigned)effectiveUserIdentifier
{
  return self->_effectiveUserIdentifier;
}

- (unsigned)effectiveGroupIdentifier
{
  return self->_effectiveGroupIdentifier;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)connections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnections:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSMutableSet)connectionInvalidationRegistrations
{
  return self->_connectionInvalidationRegistrations;
}

- (void)setConnectionInvalidationRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInvalidationRegistrations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInvalidationRegistrations, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
