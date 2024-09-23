@implementation AEAnonymousXPCConnectionOrigin

- (id)initWithEndpoint:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)AEAnonymousXPCConnectionOrigin;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)makeConnection
{
  id v3;
  NSXPCListenerEndpoint *endpoint;

  v3 = objc_alloc(MEMORY[0x24BDD1988]);
  if (self)
    endpoint = self->_endpoint;
  else
    endpoint = 0;
  return (id)objc_msgSend(v3, "initWithListenerEndpoint:", endpoint);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
