@implementation FCBalancedCounter

- (FCBalancedCounter)init
{
  FCBalancedCounter *v2;
  FCBalancedCounter *v3;
  dispatch_group_t v4;
  OS_dispatch_group *dispatchGroup;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCBalancedCounter;
  v2 = -[FCBalancedCounter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_group_create();
    dispatchGroup = v3->_dispatchGroup;
    v3->_dispatchGroup = (OS_dispatch_group *)v4;

  }
  return v3;
}

- (void)increment
{
  -[FCBalancedCounter _bumpCounterPositively:](self, "_bumpCounterPositively:", 1);
}

- (void)decrement
{
  -[FCBalancedCounter _bumpCounterPositively:](self, "_bumpCounterPositively:", 0);
}

- (void)notifyWhenCountReachesZeroOnQueue:(id)a3 usingBlock:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "queue");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBalancedCounter notifyWhenCountReachesZeroOnQueue:usingBlock:]";
    v12 = 2080;
    v13 = "FCBalancedCounter.m";
    v14 = 1024;
    v15 = 47;
    v16 = 2114;
    v17 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v7)
      goto LABEL_6;
  }
  else if (v7)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "block");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCBalancedCounter notifyWhenCountReachesZeroOnQueue:usingBlock:]";
    v12 = 2080;
    v13 = "FCBalancedCounter.m";
    v14 = 1024;
    v15 = 48;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  dispatch_group_notify((dispatch_group_t)self->_dispatchGroup, v6, v7);

}

- (void)_bumpCounterPositively:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  int64_t count;
  int64_t v7;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  count = self->_count;
  v7 = count - 1;
  if (v3)
    v7 = count + 1;
  self->_count = v7;
  if (count)
  {
    if (!v7)
      dispatch_group_leave((dispatch_group_t)self->_dispatchGroup);
  }
  else
  {
    dispatch_group_enter((dispatch_group_t)self->_dispatchGroup);
  }
  os_unfair_lock_unlock(p_lock);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
