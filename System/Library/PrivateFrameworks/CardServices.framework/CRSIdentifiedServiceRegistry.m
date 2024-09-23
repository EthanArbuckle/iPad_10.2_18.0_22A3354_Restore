@implementation CRSIdentifiedServiceRegistry

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__CRSIdentifiedServiceRegistry_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sRegistry;
}

void __46__CRSIdentifiedServiceRegistry_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sRegistry;
  sharedInstance_sRegistry = (uint64_t)v0;

}

- (CRSIdentifiedServiceRegistry)init
{
  CRSIdentifiedServiceRegistry *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *identifiedServices;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRSIdentifiedServiceRegistry;
  v2 = -[CRSIdentifiedServiceRegistry init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x24BDBCEE0]);
    identifiedServices = v2->_identifiedServices;
    v2->_identifiedServices = v3;

  }
  return v2;
}

- (void)registerIdentifiedService:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((-[NSMutableOrderedSet containsObject:](self->_identifiedServices, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_identifiedServices, "addObject:", v4);
    v5 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_219849000, v5, OS_LOG_TYPE_INFO, "Registered service with CardServices: %@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (id)identifiedServices
{
  return (id)-[NSMutableOrderedSet array](self->_identifiedServices, "array");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiedServices, 0);
}

@end
