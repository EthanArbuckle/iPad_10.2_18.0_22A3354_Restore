@implementation CRKConcreteNetworkEndpoint

- (CRKConcreteNetworkEndpoint)initWithUnderlyingEndpoint:(id)a3
{
  id v5;
  CRKConcreteNetworkEndpoint *v6;
  CRKConcreteNetworkEndpoint *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkEndpoint;
  v6 = -[CRKConcreteNetworkEndpoint init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingEndpoint, a3);

  return v7;
}

- (NSString)IPAddress
{
  NSString *IPAddress;
  NSString *v4;
  NSString *v5;
  _QWORD v7[5];

  IPAddress = self->_IPAddress;
  if (!IPAddress)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__CRKConcreteNetworkEndpoint_IPAddress__block_invoke;
    v7[3] = &unk_24D9C9940;
    v7[4] = self;
    __39__CRKConcreteNetworkEndpoint_IPAddress__block_invoke((uint64_t)v7);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_IPAddress;
    self->_IPAddress = v4;

    IPAddress = self->_IPAddress;
  }
  return IPAddress;
}

id __39__CRKConcreteNetworkEndpoint_IPAddress__block_invoke(uint64_t a1)
{
  NSObject *v1;
  char *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "underlyingEndpoint");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = nw_endpoint_copy_address_string(v1);

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v2);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (OS_nw_endpoint)underlyingEndpoint
{
  return self->_underlyingEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingEndpoint, 0);
  objc_storeStrong((id *)&self->_IPAddress, 0);
}

@end
