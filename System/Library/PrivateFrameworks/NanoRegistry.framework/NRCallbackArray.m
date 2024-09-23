@implementation NRCallbackArray

- (NRCallbackArray)init
{
  NRCallbackArray *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRCallbackArray;
  result = -[NRCallbackArray init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)addObject:(id)a3
{
  NSMutableArray *callbacks;
  void *v5;
  id v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  if (callbacks)
  {
    v5 = (void *)MEMORY[0x1A1B01DE4](v9);
    -[NSMutableArray addObject:](callbacks, "addObject:", v5);
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v5 = (void *)MEMORY[0x1A1B01DE4](v9);
    v7 = (NSMutableArray *)objc_msgSend(v6, "initWithObjects:", v5, 0);
    v8 = self->_callbacks;
    self->_callbacks = v7;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)sweepWithCollection:(id)a3
{
  os_unfair_lock_s *p_lock;
  id *p_callbacks;
  NSMutableArray *v6;
  NSMutableArray *callbacks;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  int v11;
  uint64_t (**v12)(_QWORD, _QWORD);
  int v13;
  id v14;

  v14 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  callbacks = self->_callbacks;
  p_callbacks = (id *)&self->_callbacks;
  v6 = callbacks;
  v8 = callbacks;
  v9 = *p_callbacks;
  *p_callbacks = 0;

  os_unfair_lock_unlock(p_lock);
  if (v8)
  {
    if (-[NSMutableArray count](v8, "count"))
    {
      v10 = 0;
      v11 = 0;
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v10);
        v12 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v13 = ((uint64_t (**)(_QWORD, id))v12)[2](v12, v14);

        if (v13)
          -[NSMutableArray removeObjectAtIndex:](v8, "removeObjectAtIndex:", v10);
        else
          ++v11;
        v10 = v11;
      }
      while (-[NSMutableArray count](v8, "count") > (unint64_t)v11);
    }
    if (-[NSMutableArray count](v8, "count"))
    {
      os_unfair_lock_lock(p_lock);
      if (*p_callbacks)
        objc_msgSend(*p_callbacks, "addObjectsFromArray:", v8);
      else
        objc_storeStrong(p_callbacks, v6);
      os_unfair_lock_unlock(p_lock);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
}

@end
