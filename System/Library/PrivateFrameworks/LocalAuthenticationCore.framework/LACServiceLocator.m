@implementation LACServiceLocator

- (LACServiceLocator)init
{
  LACServiceLocator *v2;
  uint64_t v3;
  NSMapTable *services;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACServiceLocator;
  v2 = -[LACServiceLocator init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    services = v2->_services;
    v2->_services = (NSMapTable *)v3;

  }
  return v2;
}

- (void)registerService:(id)a3 identifier:(id)a4
{
  -[NSMapTable setObject:forKey:](self->_services, "setObject:forKey:", a3, a4);
}

- (id)serviceWithIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_services, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
