@implementation _IDSXPCCheckinManager

- (_IDSXPCCheckinManager)init
{
  void *v3;
  _IDSXPCCheckinManager *v4;

  objc_msgSend(MEMORY[0x1E0D34D10], "XPCAdapter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_IDSXPCCheckinManager initWithXPCAdapter:](self, "initWithXPCAdapter:", v3);

  return v4;
}

- (_IDSXPCCheckinManager)initWithXPCAdapter:(id)a3
{
  id v5;
  _IDSXPCCheckinManager *v6;
  _IDSXPCCheckinManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *connectionInfoByServiceIdentifier;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_IDSXPCCheckinManager;
  v6 = -[_IDSXPCCheckinManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_checkinLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    connectionInfoByServiceIdentifier = v7->_connectionInfoByServiceIdentifier;
    v7->_connectionInfoByServiceIdentifier = v8;

    objc_storeStrong((id *)&v7->_XPCAdapter, a3);
  }

  return v7;
}

- (void)noteCreatedService:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _IDSXPCCheckinManager *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1906E62E4;
    v6[3] = &unk_1E2C64D78;
    v7 = v4;
    v8 = self;
    -[_IDSXPCCheckinManager _performLockedAccess:](self, "_performLockedAccess:", v6);

  }
}

- (void)_performLockedAccess:(id)a3
{
  os_unfair_lock_s *p_checkinLock;
  void (**v5)(id, NSMutableDictionary *);

  p_checkinLock = &self->_checkinLock;
  v5 = (void (**)(id, NSMutableDictionary *))a3;
  os_unfair_lock_lock(p_checkinLock);
  v5[2](v5, self->_connectionInfoByServiceIdentifier);

  os_unfair_lock_unlock(p_checkinLock);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1906EE5C4;
  block[3] = &unk_1E2C62C70;
  block[4] = a1;
  if (qword_1ECDD6668 != -1)
    dispatch_once(&qword_1ECDD6668, block);
  return (id)qword_1ECDD6670;
}

- (IDSXPCAdapter)XPCAdapter
{
  return self->_XPCAdapter;
}

- (void)noteFinishedTransactionForService:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1907CF1D0;
    v6[3] = &unk_1E2C64DA0;
    v7 = v4;
    -[_IDSXPCCheckinManager _performLockedAccess:](self, "_performLockedAccess:", v6);

  }
}

- (void)teardownService:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = sub_1907CF35C;
    v6[3] = &unk_1E2C64DA0;
    v7 = v4;
    -[_IDSXPCCheckinManager _performLockedAccess:](self, "_performLockedAccess:", v6);

  }
}

- (void)teardownAll
{
  -[_IDSXPCCheckinManager _performLockedAccess:](self, "_performLockedAccess:", &unk_1E2C5FD70);
}

- (void)_temporarilyStoreMessage:(id)a3 forServiceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1907CF5A0;
    v9[3] = &unk_1E2C64D78;
    v10 = v7;
    v11 = v6;
    -[_IDSXPCCheckinManager _performLockedAccess:](self, "_performLockedAccess:", v9);

  }
}

- (NSMutableDictionary)connectionInfoByServiceIdentifier
{
  return self->_connectionInfoByServiceIdentifier;
}

- (void)setConnectionInfoByServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_connectionInfoByServiceIdentifier, a3);
}

- (os_unfair_lock_s)checkinLock
{
  return self->_checkinLock;
}

- (void)setCheckinLock:(os_unfair_lock_s)a3
{
  self->_checkinLock = a3;
}

- (void)setXPCAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_XPCAdapter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_XPCAdapter, 0);
  objc_storeStrong((id *)&self->_connectionInfoByServiceIdentifier, 0);
}

@end
