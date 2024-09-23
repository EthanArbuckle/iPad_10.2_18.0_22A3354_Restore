@implementation BLSHPresentationUpdates

- (BLSHPresentationUpdates)initWithStartDate:(id)a3 updates:(id)a4 nextUpdatesStart:(id)a5
{
  id v9;
  id v10;
  id v11;
  BLSHPresentationUpdates *v12;
  BLSHPresentationUpdates *v13;
  uint64_t v14;
  NSMutableArray *updates;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLSHPresentationUpdates;
  v12 = -[BLSHPresentationUpdates init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_startDate, a3);
    v14 = objc_msgSend(v10, "mutableCopy");
    updates = v13->_updates;
    v13->_updates = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v13->_nextUpdatesStart, a5);
  }

  return v13;
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("BLSHPresentationUpdates.m");
  v16 = 1024;
  v17 = 37;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2145AC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (BOOL)isCompleted
{
  BLSHPresentationUpdates *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[NSMutableArray count](v2->_updates, "count") == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_updates, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeueNextUpdate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v4 = 0;
  }
  else
  {
    -[NSMutableArray firstObject](self->_updates, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[NSMutableArray removeObjectAtIndex:](self->_updates, "removeObjectAtIndex:", 0);
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeueAllUpdates
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_updates, "copy");
  -[NSMutableArray removeAllObjects](self->_updates, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)isValidWithNowDate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  char v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
    v6 = 0;
  else
    v6 = objc_msgSend(v4, "bls_isOnOrAfter:andOnOrBefore:", self->_startDate, self->_nextUpdatesStart);
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)peekNextUpdate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSDate *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_updates, "count"))
  {
    -[NSMutableArray firstObject](self->_updates, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationDate");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_nextUpdatesStart;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSDate *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableArray count](self->_updates, "count"))
  {
    -[NSMutableArray firstObject](self->_updates, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationDate");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_nextUpdatesStart;
  }
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate bls_shortLoggingString](self->_startDate, "bls_shortLoggingString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("start"));

  -[NSDate bls_shortLoggingString](self->_nextUpdatesStart, "bls_shortLoggingString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("nextStart"));

  -[NSMutableArray bls_boundedDescription](self->_updates, "bls_boundedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("updates"));

  v7 = (id)objc_msgSend(v3, "appendBool:withName:ifEqualTo:", self->_invalidated, CFSTR("invalidated"), 1);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)nextUpdatesStart
{
  return self->_nextUpdatesStart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextUpdatesStart, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
