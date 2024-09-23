@implementation BMDistributedContextUserDefaultStorage

- (BMDistributedContextUserDefaultStorage)initWithUserDefault:(id)a3
{
  id v5;
  BMDistributedContextUserDefaultStorage *v6;
  BMDistributedContextUserDefaultStorage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BMDistributedContextUserDefaultStorage;
  v6 = -[BMDistributedContextUserDefaultStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_storage, a3);

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  -[NSUserDefaults setObject:forKey:](self->_storage, "setObject:forKey:", a3, a4);
}

- (void)removeObjectForKey:(id)a3
{
  -[NSUserDefaults removeObjectForKey:](self->_storage, "removeObjectForKey:", a3);
}

- (id)objectForKey:(id)a3
{
  return -[NSUserDefaults objectForKey:](self->_storage, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
