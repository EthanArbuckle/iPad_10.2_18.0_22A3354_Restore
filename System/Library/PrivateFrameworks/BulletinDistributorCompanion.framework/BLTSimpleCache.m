@implementation BLTSimpleCache

- (BLTSimpleCache)initWithCapacity:(unint64_t)a3
{
  BLTSimpleCache *v4;
  BLTSimpleCache *v5;
  uint64_t v6;
  NSMutableArray *objects;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLTSimpleCache;
  v4 = -[BLTSimpleCache init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lock._os_unfair_lock_opaque = 0;
    v4->_capacity = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    objects = v5->_objects;
    v5->_objects = (NSMutableArray *)v6;

  }
  return v5;
}

- (void)cacheObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableArray removeObject:](self->_objects, "removeObject:", v5);
  -[NSMutableArray insertObject:atIndex:](self->_objects, "insertObject:atIndex:", v5, 0);

  if (-[NSMutableArray count](self->_objects, "count") > self->_capacity)
    -[NSMutableArray removeObjectAtIndex:](self->_objects, "removeObjectAtIndex:");
  os_unfair_lock_unlock(p_lock);
}

- (id)objects
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_objects, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTSimpleCache objects](self, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("objects"), 0);

  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

@end
