@implementation MKSRPPrecheck

- (MKSRPPrecheck)initWithPassword:(id)a3
{
  id v4;
  MKSRPPrecheck *v5;
  MKSRPPrecheck *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *servers;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MKSRPPrecheck;
  v5 = -[MKSRPPrecheck init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MKSRPPrecheck setPassword:](v5, "setPassword:", v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    servers = v6->_servers;
    v6->_servers = v7;

  }
  return v6;
}

- (void)setServerForKey:(id)a3
{
  MKSRPPrecheck *v4;
  MKSRPServer *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[MKSRPServer initWithPassword:]([MKSRPServer alloc], "initWithPassword:", v4->_password);
  -[NSMutableDictionary setObject:forKey:](v4->_servers, "setObject:forKey:", v5, v6);

  objc_sync_exit(v4);
}

- (id)serverForKey:(id)a3
{
  id v4;
  MKSRPPrecheck *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](v5->_servers, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (void)removeServerForKey:(id)a3
{
  MKSRPPrecheck *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary removeObjectForKey:](v4->_servers, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_servers, 0);
}

@end
