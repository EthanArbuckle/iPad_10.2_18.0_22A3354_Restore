@implementation DCAtomicLRUCache

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  DCAtomicLRUCache *v8;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9.receiver = v8;
  v9.super_class = (Class)DCAtomicLRUCache;
  -[DCLRUCache setObject:forKey:](&v9, sel_setObject_forKey_, v6, v7);
  objc_sync_exit(v8);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  DCAtomicLRUCache *v5;
  objc_super v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6.receiver = v5;
  v6.super_class = (Class)DCAtomicLRUCache;
  -[DCLRUCache removeObjectForKey:](&v6, sel_removeObjectForKey_, v4);
  objc_sync_exit(v5);

}

- (id)objectForKey:(id)a3
{
  id v4;
  DCAtomicLRUCache *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v8.receiver = v5;
  v8.super_class = (Class)DCAtomicLRUCache;
  -[DCLRUCache objectForKey:](&v8, sel_objectForKey_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)allKeys
{
  DCAtomicLRUCache *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  v6.receiver = v2;
  v6.super_class = (Class)DCAtomicLRUCache;
  -[DCLRUCache allKeys](&v6, sel_allKeys);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return v4;
}

@end
