@implementation NSSafeMutableDictionary

- (id)objectForKey:(id)a3
{
  NSLock *lock;
  id v5;
  void *v6;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableDictionary objectForKey:](self->_storage, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (NSSafeMutableDictionary)init
{
  NSSafeMutableDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *storage;
  NSLock *v5;
  NSLock *lock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSafeMutableDictionary;
  v2 = -[NSSafeMutableDictionary init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    storage = v2->_storage;
    v2->_storage = v3;

    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v5;

  }
  return v2;
}

- (void)removeAllObjects
{
  -[NSLock lock](self->_lock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_storage, "removeAllObjects");
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)removeObjectForKey:(id)a3
{
  NSLock *lock;
  id v5;

  lock = self->_lock;
  v5 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableDictionary removeObjectForKey:](self->_storage, "removeObjectForKey:", v5);

  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  NSLock *lock;
  id v7;
  id v8;

  lock = self->_lock;
  v7 = a4;
  v8 = a3;
  -[NSLock lock](lock, "lock");
  -[NSMutableDictionary setObject:forKey:](self->_storage, "setObject:forKey:", v8, v7);

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)keyEnumerator
{
  return (id)-[NSMutableDictionary keyEnumerator](self->_storage, "keyEnumerator");
}

- (unint64_t)count
{
  unint64_t v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[NSMutableDictionary count](self->_storage, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
