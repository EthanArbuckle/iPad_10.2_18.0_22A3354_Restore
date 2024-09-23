@implementation GCObjectPool

- (GCObjectPool)init
{
  GCObjectPool *v2;
  uint64_t v3;
  NSMutableArray *objects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCObjectPool;
  v2 = -[GCObjectPool init](&v6, sel_init);
  if (v2)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    objects = v2->objects;
    v2->objects = (NSMutableArray *)v3;

    v2->lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)takeObjectOrCreateWith:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;

  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(&self->lock);
  -[NSMutableArray lastObject](self->objects, "lastObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[NSMutableArray removeLastObject](self->objects, "removeLastObject");
    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->lock);
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)addObjectWith:(id)a3
{
  void (**v4)(_QWORD);
  os_unfair_lock_s *p_lock;
  unint64_t v6;
  NSMutableArray *objects;
  void *v8;

  v4 = (void (**)(_QWORD))a3;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  v6 = -[NSMutableArray count](self->objects, "count");
  if (v6 <= 9)
  {
    objects = self->objects;
    v4[2](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](objects, "addObject:", v8);

  }
  os_unfair_lock_unlock(p_lock);

  return v6 < 0xA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->objects, 0);
}

@end
