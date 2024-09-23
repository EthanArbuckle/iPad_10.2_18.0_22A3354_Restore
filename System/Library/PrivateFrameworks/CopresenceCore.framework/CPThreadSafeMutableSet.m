@implementation CPThreadSafeMutableSet

- (CPThreadSafeMutableSet)init
{
  CPThreadSafeMutableSet *v2;
  uint64_t v3;
  NSMutableSet *mutableSet;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPThreadSafeMutableSet;
  v2 = -[CPThreadSafeMutableSet init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableSet = v2->_mutableSet;
    v2->_mutableSet = (NSMutableSet *)v3;

    v2->_operationLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)CPThreadSafeMutableSet;
  -[CPThreadSafeMutableSet description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, self->_mutableSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addObject:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_operationLock);
  -[NSMutableSet addObject:](self->_mutableSet, "addObject:", v4);
  os_unfair_lock_unlock(&self->_operationLock);

}

- (void)unionSet:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_operationLock);
  -[NSMutableSet unionSet:](self->_mutableSet, "unionSet:", v4);
  os_unfair_lock_unlock(&self->_operationLock);

}

- (BOOL)containsObject:(id)a3
{
  id v4;
  os_unfair_lock_s *p_operationLock;

  v4 = a3;
  p_operationLock = &self->_operationLock;
  os_unfair_lock_lock(&self->_operationLock);
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_mutableSet, "containsObject:", v4);
  os_unfair_lock_unlock(p_operationLock);

  return (char)self;
}

- (os_unfair_lock_s)operationLock
{
  return self->_operationLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableSet, 0);
}

@end
