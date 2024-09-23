@implementation CRKConcreteNetworkInterface

- (CRKConcreteNetworkInterface)initWithUnderlyingInterface:(id)a3
{
  id v5;
  CRKConcreteNetworkInterface *v6;
  CRKConcreteNetworkInterface *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkInterface;
  v6 = -[CRKConcreteNetworkInterface init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingInterface, a3);

  return v7;
}

- (NSString)name
{
  NSString *name;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  name = self->_name;
  if (!name)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__CRKConcreteNetworkInterface_name__block_invoke;
    v7[3] = &unk_24D9C9940;
    v7[4] = self;
    __35__CRKConcreteNetworkInterface_name__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_name;
    self->_name = v4;

    name = self->_name;
  }
  return name;
}

uint64_t __35__CRKConcreteNetworkInterface_name__block_invoke(uint64_t a1)
{
  NSObject *v1;
  const char *name;

  objc_msgSend(*(id *)(a1 + 32), "underlyingInterface");
  v1 = objc_claimAutoreleasedReturnValue();
  name = nw_interface_get_name(v1);

  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", name);
}

- (CRKNetworkEndpoint)ipv4Endpoint
{
  CRKNetworkEndpoint *ipv4Endpoint;
  CRKNetworkEndpoint **p_ipv4Endpoint;

  p_ipv4Endpoint = &self->_ipv4Endpoint;
  ipv4Endpoint = self->_ipv4Endpoint;
  if (!ipv4Endpoint)
  {
    objc_storeStrong((id *)p_ipv4Endpoint, -[CRKConcreteNetworkInterface makeLocalEndpointForRemoteEndpointWithHost:port:](self, "makeLocalEndpointForRemoteEndpointWithHost:port:", CFSTR("0.0.0.0"), CFSTR("0")));
    ipv4Endpoint = self->_ipv4Endpoint;
  }
  return ipv4Endpoint;
}

- (CRKNetworkEndpoint)ipv6Endpoint
{
  CRKNetworkEndpoint *ipv6Endpoint;
  CRKNetworkEndpoint **p_ipv6Endpoint;

  p_ipv6Endpoint = &self->_ipv6Endpoint;
  ipv6Endpoint = self->_ipv6Endpoint;
  if (!ipv6Endpoint)
  {
    objc_storeStrong((id *)p_ipv6Endpoint, -[CRKConcreteNetworkInterface makeLocalEndpointForRemoteEndpointWithHost:port:](self, "makeLocalEndpointForRemoteEndpointWithHost:port:", CFSTR("::"), CFSTR("0")));
    ipv6Endpoint = self->_ipv6Endpoint;
  }
  return ipv6Endpoint;
}

- (id)makeLocalEndpointForRemoteEndpointWithHost:(id)a3 port:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  nw_endpoint_t host;
  void *v12;
  void *v13;
  CRKConcreteNetworkEndpoint *v14;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = (const char *)objc_msgSend(v6, "UTF8String");
  v9 = objc_retainAutorelease(v7);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  host = nw_endpoint_create_host(v8, v10);
  if (host)
  {
    -[CRKConcreteNetworkInterface underlyingInterface](self, "underlyingInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)nw_interface_copy_local_address_for_remote_address();

    if (v13)
      v14 = -[CRKConcreteNetworkEndpoint initWithUnderlyingEndpoint:]([CRKConcreteNetworkEndpoint alloc], "initWithUnderlyingEndpoint:", v13);
    else
      v14 = 0;

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (OS_nw_interface)underlyingInterface
{
  return self->_underlyingInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingInterface, 0);
  objc_storeStrong((id *)&self->_ipv6Endpoint, 0);
  objc_storeStrong((id *)&self->_ipv4Endpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
