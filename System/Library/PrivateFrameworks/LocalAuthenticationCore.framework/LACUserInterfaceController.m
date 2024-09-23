@implementation LACUserInterfaceController

- (LACUserInterfaceController)init
{
  LACUserInterfaceController *v2;
  uint64_t v3;
  NSMapTable *activeUserInterfaces;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LACUserInterfaceController;
  v2 = -[LACUserInterfaceController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    activeUserInterfaces = v2->_activeUserInterfaces;
    v2->_activeUserInterfaces = (NSMapTable *)v3;

  }
  return v2;
}

- (id)userInterface
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LACUserInterfaceController userInterfaceWithUUID:](self, "userInterfaceWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userInterfaceWithUUID:(id)a3
{
  id v4;
  LACUserInterfaceSpringBoardAdapter *v5;

  v4 = a3;
  v5 = -[LACUserInterfaceSpringBoardAdapter initWithBundleId:configurationId:]([LACUserInterfaceSpringBoardAdapter alloc], "initWithBundleId:configurationId:", CFSTR("com.apple.CoreAuthUI"), CFSTR("RemoteAlert"));
  -[NSMapTable setObject:forKey:](self->_activeUserInterfaces, "setObject:forKey:", v5, v4);

  return v5;
}

- (void)terminateAllUserInterfacesWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  -[NSMapTable objectEnumerator](self->_activeUserInterfaces, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    do
    {
      objc_msgSend(v5, "terminateWithReason:", v8);
      -[NSMapTable objectEnumerator](self->_activeUserInterfaces, "objectEnumerator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }

}

- (void)terminateUserInterfaceWithUUID:(id)a3 reason:(id)a4
{
  NSMapTable *activeUserInterfaces;
  id v6;
  id v7;

  activeUserInterfaces = self->_activeUserInterfaces;
  v6 = a4;
  -[NSMapTable objectForKey:](activeUserInterfaces, "objectForKey:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "terminateWithReason:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeUserInterfaces, 0);
}

@end
