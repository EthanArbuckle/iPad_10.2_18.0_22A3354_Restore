@implementation APXPCActionRequester

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_finished(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)APXPCActionRequester;
  -[APXPCActionRequester dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend_xpcConnection(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v8, v9, (uint64_t)v4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend_delegateID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@.%@"), v10, v4, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSUUID)delegateID
{
  return self->_delegateID;
}

- (APXPCActionRequester)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  APXPCActionRequester *v5;
  uint64_t v6;
  NSUUID *delegateID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APXPCActionRequester;
  v5 = -[APXPCActionRequester init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v2, v3, v4);
    v6 = objc_claimAutoreleasedReturnValue();
    delegateID = v5->_delegateID;
    v5->_delegateID = (NSUUID *)v6;

  }
  return v5;
}

- (Protocol)exportedInterface
{
  return self->_exportedInterface;
}

- (id)remoteObjectProxy
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_xpcConnection(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_remoteObjectProxy(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)xpcConnection
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  APXPCRemoteConnection *v18;
  APXPCRemoteConnection *connection;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend_unfairLock(APXPCActionRequester, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v5, v6, v7, v8);
  if (!self->_connection)
  {
    v12 = (void *)objc_opt_class();
    if (objc_msgSend_canShareConnection(v12, v13, v14, v15))
      objc_msgSend_sharedConnectionFor_(APXPCRemoteConnection, v16, (uint64_t)self, v17);
    else
      objc_msgSend_connectionFor_(APXPCRemoteConnection, v16, (uint64_t)self, v17);
    v18 = (APXPCRemoteConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v18;

  }
  objc_msgSend_xpcConnection(self->_connection, v9, v10, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v5, v21, v22, v23);

  return v20;
}

- (void)finished
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  APXPCRemoteConnection *connection;
  APXPCRemoteConnection *v12;
  id v13;

  objc_msgSend_unfairLock(APXPCActionRequester, a2, v2, v3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v13, v5, v6, v7);
  connection = self->_connection;
  if (connection)
  {
    objc_msgSend_invalidateForDelegate_(connection, v8, (uint64_t)self, v10);
    v12 = self->_connection;
    self->_connection = 0;

  }
  objc_msgSend_unlock(v13, v8, v9, v10);

}

+ (APUnfairLock)unfairLock
{
  if (qword_1ED2BC9B8 != -1)
    dispatch_once(&qword_1ED2BC9B8, &unk_1E8C48110);
  return (APUnfairLock *)(id)qword_1ED2BC9A8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSUUID *delegateID;
  void *v13;
  const char *v14;
  uint64_t v15;
  char isEqual;

  v4 = a3;
  if (v4 && (v5 = (void *)objc_opt_class(), v6 = objc_opt_class(), objc_msgSend_isEqual_(v5, v7, v6, v8)))
  {
    delegateID = self->_delegateID;
    objc_msgSend_delegateID(v4, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(delegateID, v14, (uint64_t)v13, v15);

  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (id)remoteObjectInterface
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v7, 1u);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v15, v9, (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)connectionInterrupted
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v7, 1u);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v15, v9, (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (void)connectionInvalidated
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v7, 1u);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v15, v9, (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

+ (BOOL)canShareConnection
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v7, 1u);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v15, v9, (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

+ (id)machService
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("You must override %@ in a subclass"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  APSimulateCrash((const char *)5, v7, 1u);

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v10, v12, (uint64_t)CFSTR("You must override %@ in a subclass"), v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v8, v15, v9, (uint64_t)v14, 0);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v16);
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong(&self->_remoteObjectProxy, a3);
}

- (APXPCRemoteConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void)setDelegateID:(id)a3
{
  objc_storeStrong((id *)&self->_delegateID, a3);
}

@end
