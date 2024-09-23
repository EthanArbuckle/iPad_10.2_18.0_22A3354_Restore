@implementation TabSnapshotCacheContext

- (NSOrderedSet)identifiersToCache
{
  return self->_identifiersToCache;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (BOOL)updating
{
  return self->_updating;
}

- (void)setCapacity:(unint64_t)a3
{
  self->_capacity = a3;
}

- (void)setIdentifiersToCache:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToCache, a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_updating)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; updating = %@; capacity = %zu>"), v5, self, v7, self->_capacity);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToCache, 0);
}

@end
