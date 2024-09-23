@implementation PHAssociatedObjectsEntry

- (PHAssociatedObjectsEntry)init
{
  PHAssociatedObjectsEntry *v2;
  PHAssociatedObjectsEntry *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *associatedObjects;
  PHAssociatedObjectsEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHAssociatedObjectsEntry;
  v2 = -[PHAssociatedObjectsEntry init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    associatedObjects = v3->_associatedObjects;
    v3->_associatedObjects = v4;

    v6 = v3;
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedObjects, 0);
}

- (id)associatedObjectForKey:(os_unfair_lock_s *)a1
{
  uint64_t v2;
  os_unfair_lock_s *v3;
  id v4;

  v2 = (uint64_t)a1;
  if (a1)
  {
    v3 = a1 + 2;
    v4 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(v2 + 8));
    objc_msgSend(*(id *)(v2 + 16), "objectForKeyedSubscript:", v4);
    v2 = objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v3);
  }
  return (id)v2;
}

- (void)setAssociatedObject:(void *)a3 forKey:
{
  os_unfair_lock_s *v5;
  id v6;
  id v7;

  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 8);
    v6 = a3;
    v7 = a2;
    os_unfair_lock_lock(v5);
    objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v7, v6);

    os_unfair_lock_unlock(v5);
  }
}

- (id)setAssociatedObjectIfNotSet:(void *)a3 forKey:
{
  id v5;
  id v6;
  id v7;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(*(id *)(a1 + 16), "setObject:forKeyedSubscript:", v5, v6);
      v7 = v5;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
