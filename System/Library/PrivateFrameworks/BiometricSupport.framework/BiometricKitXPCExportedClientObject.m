@implementation BiometricKitXPCExportedClientObject

- (BiometricKitXPCExportedClientObject)initWithClientID:(unint64_t)a3 clientInfo:(id)a4 exportedObject:(id)a5
{
  id v8;
  id v9;
  BiometricKitXPCExportedClientObject *v10;
  BiometricKitXPCExportedClientObject *v11;
  uint64_t v12;
  NSDictionary *clientInfo;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BiometricKitXPCExportedClientObject;
  v10 = -[BiometricKitXPCExportedClientObject init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_clientID = a3;
    v12 = objc_msgSend(v8, "copy");
    clientInfo = v11->_clientInfo;
    v11->_clientInfo = (NSDictionary *)v12;

    objc_storeWeak((id *)&v11->_exportedObject, v9);
  }

  return v11;
}

- (id)name
{
  void *v3;
  const __CFString *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = CFSTR("BKClientBundleIdentifier");
  else
    v4 = CFSTR("BKClientProcessName");
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BiometricKitXPCExportedClientObject name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_clientInfo, "objectForKeyedSubscript:", CFSTR("BKClientConnectionId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: %@[%@]>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setDelegateRegistered:(BOOL)a3
{
  self->_delegateRegistered = a3;
}

- (void)setClientAppIsBackground:(BOOL)a3
{
  self->_clientAppIsBackground = a3;
}

- (void)setClientAppIsInactive:(BOOL)a3
{
  self->_clientAppIsInactive = a3;
}

- (BiometricKitXPCExportedObject)exportedObject
{
  return (BiometricKitXPCExportedObject *)objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (void)enrollResult:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v5 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 2, "-[BiometricKitXPCExportedClientObject enrollResult:]");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enrollResult:details:client:", v9, 0, self->_clientID);

  }
}

- (void)enrollResult:(id)a3 details:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v8 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 2, "-[BiometricKitXPCExportedClientObject enrollResult:details:]");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enrollResult:details:client:", v12, v6, self->_clientID);

  }
}

- (void)enrollUpdate:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v5 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 2, "-[BiometricKitXPCExportedClientObject enrollUpdate:]");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enrollUpdate:client:", v9, self->_clientID);

  }
}

- (void)enrollFeedback:(id)a3
{
  id WeakRetained;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v5 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 2, "-[BiometricKitXPCExportedClientObject enrollFeedback:]");

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v6, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enrollFeedback:client:", v9, self->_clientID);

  }
}

- (void)matchResult:(id)a3 details:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v8 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 4, "-[BiometricKitXPCExportedClientObject matchResult:details:]");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "matchResult:details:client:", v12, v6, self->_clientID);

  }
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3;
  BiometricKitXPCExportedObject **p_exportedObject;
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  p_exportedObject = &self->_exportedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v7 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject statusMessage:]");

  if (v7)
  {
    v10 = objc_loadWeakRetained((id *)p_exportedObject);
    objc_msgSend(v10, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusMessage:client:", v3, self->_clientID);

  }
}

- (void)statusMessage:(unsigned int)a3 details:(id)a4
{
  uint64_t v4;
  id WeakRetained;
  int v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v7 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject statusMessage:details:]");

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusMessage:details:client:", v4, v11, self->_clientID);

  }
}

- (void)homeButtonPressed
{
  BiometricKitXPCExportedObject **p_exportedObject;
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  id v8;

  p_exportedObject = &self->_exportedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v5 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject homeButtonPressed]");

  if (v5)
  {
    v8 = objc_loadWeakRetained((id *)p_exportedObject);
    objc_msgSend(v8, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteObjectProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeButtonPressed:", self->_clientID);

  }
}

- (void)touchIDButtonPressed:(BOOL)a3
{
  _BOOL8 v3;
  BiometricKitXPCExportedObject **p_exportedObject;
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  p_exportedObject = &self->_exportedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v7 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject touchIDButtonPressed:]");

  if (v7)
  {
    v10 = objc_loadWeakRetained((id *)p_exportedObject);
    objc_msgSend(v10, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "touchIDButtonPressed:client:", v3, self->_clientID);

  }
}

- (void)templateUpdate:(id)a3 details:(id)a4
{
  id v6;
  id WeakRetained;
  int v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v8 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject templateUpdate:details:]");

  if (v8)
  {
    v9 = objc_loadWeakRetained((id *)&self->_exportedObject);
    objc_msgSend(v9, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteObjectProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "templateUpdate:details:client:", v12, v6, self->_clientID);

  }
}

- (void)taskResumeStatus:(int)a3
{
  uint64_t v3;
  BiometricKitXPCExportedObject **p_exportedObject;
  id WeakRetained;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  p_exportedObject = &self->_exportedObject;
  WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
  v7 = objc_msgSend(WeakRetained, "isClient:entitled:forMethod:", self->_clientID, 1, "-[BiometricKitXPCExportedClientObject taskResumeStatus:]");

  if (v7)
  {
    v10 = objc_loadWeakRetained((id *)p_exportedObject);
    objc_msgSend(v10, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "taskResumeStatus:client:", v3, self->_clientID);

  }
}

- (unint64_t)clientID
{
  return self->_clientID;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)delegateRegistered
{
  return self->_delegateRegistered;
}

- (BOOL)clientAppIsBackground
{
  return self->_clientAppIsBackground;
}

- (BOOL)clientAppIsInactive
{
  return self->_clientAppIsInactive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_clientInfo, 0);
}

@end
