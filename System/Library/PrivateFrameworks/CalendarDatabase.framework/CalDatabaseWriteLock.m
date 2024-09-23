@implementation CalDatabaseWriteLock

+ (id)writeLockForDatabasePath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CalDatabaseWriteLock *v7;

  objc_msgSend(a1, "canonicalizePath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&writeLockForDatabasePath___global_lock);
  v4 = (void *)writeLockForDatabasePath___writeLocks;
  if (!writeLockForDatabasePath___writeLocks)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)writeLockForDatabasePath___writeLocks;
    writeLockForDatabasePath___writeLocks = v5;

    v4 = (void *)writeLockForDatabasePath___writeLocks;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (CalDatabaseWriteLock *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(CalDatabaseWriteLock);
    objc_msgSend((id)writeLockForDatabasePath___writeLocks, "setObject:forKey:", v7, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&writeLockForDatabasePath___global_lock);

  return v7;
}

+ (id)canonicalizePath:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("/")) & 1) == 0)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

- (CalDatabaseWriteLock)init
{
  CalDatabaseWriteLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalDatabaseWriteLock;
  result = -[CalDatabaseWriteLock init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_lock);
}

- (void)performWithWriteLock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  self = (CalDatabaseWriteLock *)((char *)self + 8);
  os_unfair_lock_lock((os_unfair_lock_t)self);
  v4[2]();
  os_unfair_lock_unlock((os_unfair_lock_t)self);

}

@end
