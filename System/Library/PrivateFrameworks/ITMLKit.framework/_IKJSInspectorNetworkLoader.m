@implementation _IKJSInspectorNetworkLoader

- (_IKJSInspectorNetworkLoader)initWithIdentifier:(id)a3 parentIdentifier:(id)a4 agent:(id)a5 dispatcher:(id)a6
{
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  _IKJSInspectorNetworkLoader *v14;
  _IKJSInspectorNetworkLoader *v15;
  __CFString *v16;
  uint64_t v17;
  NSMutableDictionary *requestRecords;
  objc_super v20;

  v10 = (__CFString *)a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_IKJSInspectorNetworkLoader;
  v14 = -[_IKJSInspectorNetworkLoader init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v10)
      v16 = v10;
    else
      v16 = CFSTR("Inspector");
    objc_storeStrong((id *)&v14->_identifier, v16);
    objc_storeStrong((id *)&v15->_parentIdentifier, a4);
    objc_storeWeak((id *)&v15->_agent, v12);
    objc_storeWeak((id *)&v15->_dispatcher, v13);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    requestRecords = v15->_requestRecords;
    v15->_requestRecords = (NSMutableDictionary *)v17;

  }
  return v15;
}

- (id)recordForResource:(int64_t)a3 withInitiator:(int64_t)a4
{
  return -[_IKJSInspectorNetworkLoader _recordForResource:withInitiator:synchronousOperation:](self, "_recordForResource:withInitiator:synchronousOperation:", a3, a4, 0);
}

- (id)_recordForResource:(int64_t)a3 withInitiator:(int64_t)a4 synchronousOperation:(BOOL)a5
{
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[_IKJSInspectorNetworkLoader agent](self, "agent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "controller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "inspector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "connected");

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:loader:resourceType:initiatorType:", v13, self, a3, a4);
    if (v14)
    {
      -[_IKJSInspectorNetworkLoader requestRecords](self, "requestRecords");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v14, v13);

    }
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)dispatchEventWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[_IKJSInspectorNetworkLoader agent](self, "agent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "controller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inspector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "connected");

  if (v8)
  {
    objc_initWeak(&location, self);
    -[_IKJSInspectorNetworkLoader agent](self, "agent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54___IKJSInspectorNetworkLoader_dispatchEventWithBlock___block_invoke;
    v12[3] = &unk_1E9F4D740;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(v11, "evaluate:completionBlock:", v12, 0);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (double)currentTimeIntervalSince1970
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  -[_IKJSInspectorNetworkLoader agent](self, "agent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "controller");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inspectorConnectDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v5 - v9;

  return v10;
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorNetworkLoader identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorNetworkLoader parentIdentifier](self, "parentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_IKJSInspectorNetworkLoader requestRecords](self, "requestRecords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier = %@, parent = %@> requestRecords: %@"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (IKJSInspectorNetworkAgent)agent
{
  return (IKJSInspectorNetworkAgent *)objc_loadWeakRetained((id *)&self->_agent);
}

- (RWIProtocolNetworkDomainEventDispatcher)dispatcher
{
  return (RWIProtocolNetworkDomainEventDispatcher *)objc_loadWeakRetained((id *)&self->_dispatcher);
}

- (NSMutableDictionary)requestRecords
{
  return self->_requestRecords;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestRecords, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_destroyWeak((id *)&self->_agent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
}

@end
