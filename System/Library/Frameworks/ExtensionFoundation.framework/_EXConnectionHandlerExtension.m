@implementation _EXConnectionHandlerExtension

- (Class)delegateClass
{
  return 0;
}

- (void)willFinishLaunching
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  NSStringFromClass(0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

}

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[_EXConnectionHandlerExtension connectionHandler](self, "connectionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_EXConnectionHandlerExtension connectionHandler](self, "connectionHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "shouldAcceptXPCConnection:", v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)principalObject
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setPrincipalObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (_EXConnectionHandler)connectionHandler
{
  return (_EXConnectionHandler *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnectionHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong(&self->_principalObject, 0);
}

@end
