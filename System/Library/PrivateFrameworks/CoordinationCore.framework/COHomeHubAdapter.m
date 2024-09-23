@implementation COHomeHubAdapter

- (COHomeHubAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COHomeHubAdapter;
  return -[COHomeHubAdapter init](&v3, sel_init);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__COHomeHubAdapter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_result;
}

void __34__COHomeHubAdapter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v1;

}

- (id)accessoryForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4
{
  return 0;
}

- (id)accessoryIdentifierForPeerInstance:(id)a3 usingHomeKitAdapter:(id)a4
{
  void *v4;
  void *v5;

  -[COHomeHubAdapter accessoryForPeerInstance:usingHomeKitAdapter:](self, "accessoryForPeerInstance:usingHomeKitAdapter:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSObject)client
{
  return self->_client;
}

- (NSObject)list
{
  return self->_list;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
