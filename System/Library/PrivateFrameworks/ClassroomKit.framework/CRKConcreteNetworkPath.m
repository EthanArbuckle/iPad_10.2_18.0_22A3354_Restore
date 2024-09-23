@implementation CRKConcreteNetworkPath

- (CRKConcreteNetworkPath)initWithUnderlyingPath:(id)a3
{
  id v5;
  CRKConcreteNetworkPath *v6;
  CRKConcreteNetworkPath *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKConcreteNetworkPath;
  v6 = -[CRKConcreteNetworkPath init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingPath, a3);

  return v7;
}

- (BOOL)isSatisfied
{
  NSObject *v2;
  nw_path_status_t status;

  -[CRKConcreteNetworkPath underlyingPath](self, "underlyingPath");
  v2 = objc_claimAutoreleasedReturnValue();
  status = nw_path_get_status(v2);

  return ((status - 1) & 0xFFFFFFFD) == 0;
}

- (NSArray)interfaces
{
  NSArray *interfaces;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[5];

  interfaces = self->_interfaces;
  if (!interfaces)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __36__CRKConcreteNetworkPath_interfaces__block_invoke;
    v7[3] = &unk_24D9C9D40;
    v7[4] = self;
    __36__CRKConcreteNetworkPath_interfaces__block_invoke((uint64_t)v7);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interfaces;
    self->_interfaces = v4;

    interfaces = self->_interfaces;
  }
  return interfaces;
}

id __36__CRKConcreteNetworkPath_interfaces__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD enumerate_block[4];
  id v8;

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "underlyingPath");
  v3 = objc_claimAutoreleasedReturnValue();
  enumerate_block[0] = MEMORY[0x24BDAC760];
  enumerate_block[1] = 3221225472;
  enumerate_block[2] = __36__CRKConcreteNetworkPath_interfaces__block_invoke_2;
  enumerate_block[3] = &unk_24D9C9D18;
  v8 = v2;
  v4 = v2;
  nw_path_enumerate_interfaces(v3, enumerate_block);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

uint64_t __36__CRKConcreteNetworkPath_interfaces__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  CRKConcreteNetworkInterface *v4;

  v3 = a2;
  v4 = -[CRKConcreteNetworkInterface initWithUnderlyingInterface:]([CRKConcreteNetworkInterface alloc], "initWithUnderlyingInterface:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  return 0;
}

- (OS_nw_path)underlyingPath
{
  return self->_underlyingPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingPath, 0);
  objc_storeStrong((id *)&self->_interfaces, 0);
}

@end
