@implementation MPAsyncOperation

- (BOOL)isExecuting
{
  MPAsyncOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_executing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isFinished
{
  MPAsyncOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSError)error
{
  os_unfair_lock_s *p_lock;
  NSError *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_error;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (BOOL)isCancelled
{
  MPAsyncOperation *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_cancelled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (ICUserIdentity)userIdentity
{
  ICUserIdentity *userIdentity;

  userIdentity = self->_userIdentity;
  if (userIdentity)
    return userIdentity;
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  return (ICUserIdentity *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)cancel
{
  -[MPAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isCancelled"));
  os_unfair_lock_lock(&self->_lock);
  self->_cancelled = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[MPAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isCancelled"));
}

- (void)finish
{
  -[MPAsyncOperation finishWithError:](self, "finishWithError:", 0);
}

- (void)start
{
  -[MPAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock(&self->_lock);
  self->_executing = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[MPAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[MPAsyncOperation execute](self, "execute");
}

- (void)finishWithError:(id)a3
{
  NSError *v4;
  NSError *error;

  v4 = (NSError *)a3;
  -[MPAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
  -[MPAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[MPAsyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  os_unfair_lock_lock(&self->_lock);
  error = self->_error;
  self->_error = v4;

  self->_executing = 0;
  self->_finished = 1;
  os_unfair_lock_unlock(&self->_lock);
  -[MPAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[MPAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[MPAsyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
}

- (MPAsyncOperation)init
{
  MPAsyncOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPAsyncOperation;
  result = -[MPAsyncOperation init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)execute
{
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(), "instanceMethodForSelector:", a2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPAsyncOperation.m"), 84, CFSTR("Subclass %@ must implement -%@ defined in %@."), v6, v7, CFSTR("[MPAsyncOperation class]"));

  }
}

- (void)setUserIdentity:(id)a3
{
  ICUserIdentity *v4;
  ICUserIdentity *userIdentity;
  void *v6;
  char v7;
  ICUserIdentity *v8;
  ICUserIdentity *v9;
  ICUserIdentity *v10;

  v4 = (ICUserIdentity *)a3;
  userIdentity = self->_userIdentity;
  v10 = v4;
  if (userIdentity != v4)
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICUserIdentity isEqualToIdentity:inStore:](userIdentity, "isEqualToIdentity:inStore:", v10, v6);

    if ((v7 & 1) == 0)
    {
      v8 = (ICUserIdentity *)-[ICUserIdentity copy](v10, "copy");
      v9 = self->_userIdentity;
      self->_userIdentity = v8;

    }
  }

}

@end
