@implementation GKDiscoveryBonjourResolveContainer

- (GKDiscoveryBonjourResolveContainer)init
{
  GKDiscoveryBonjourResolveContainer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKDiscoveryBonjourResolveContainer;
  v2 = -[GKDiscoveryBonjourResolveContainer init](&v4, sel_init);
  if (v2)
    v2->_serviceRefList = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (void)dealloc
{
  NSMutableArray *serviceRefList;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _DNSServiceRef_t *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];

  self->_resolveCompletionHandler = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  serviceRefList = self->_serviceRefList;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](serviceRefList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(serviceRefList);
        v8 = (_DNSServiceRef_t *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "pointerValue");
        if (v8)
          DNSServiceRefDeallocate(v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](serviceRefList, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)GKDiscoveryBonjourResolveContainer;
  -[GKDiscoveryBonjourResolveContainer dealloc](&v9, sel_dealloc);
}

- (NSMutableArray)serviceRefList
{
  return self->_serviceRefList;
}

- (void)setServiceRefList:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)resolveCompletionHandler
{
  return self->_resolveCompletionHandler;
}

- (void)setResolveCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (GKDiscoveryBonjour)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  self->_context = (GKDiscoveryBonjour *)a3;
}

@end
