@implementation AMSThreadSafeObject

- (void)readWrite:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, void *);
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[AMSThreadSafeObject underlyingObject](self, "underlyingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSThreadSafeObject setUnderlyingObject:](self, "setUnderlyingObject:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (id)underlyingObject
{
  os_unfair_lock_assert_owner(&self->_lock);
  return self->_underlyingObject;
}

- (void)setUnderlyingObject:(id)a3
{
  id v4;
  id underlyingObject;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  underlyingObject = self->_underlyingObject;
  self->_underlyingObject = v4;

}

- (void)read:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, void *);
  void *v6;

  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[AMSThreadSafeObject underlyingObject](self, "underlyingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);

  os_unfair_lock_unlock(p_lock);
}

- (AMSThreadSafeObject)initWithObject:(id)a3
{
  id v5;
  AMSThreadSafeObject *v6;
  AMSThreadSafeObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSThreadSafeObject;
  v6 = -[AMSThreadSafeObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v6->_underlyingObject, a3);
  }

  return v7;
}

- (AMSThreadSafeObject)init
{
  return -[AMSThreadSafeObject initWithObject:](self, "initWithObject:", 0);
}

- (id)accessAndSetObjectWithBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, void *);
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = (void (**)(id, void *))a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  -[AMSThreadSafeObject underlyingObject](self, "underlyingObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSThreadSafeObject setUnderlyingObject:](self, "setUnderlyingObject:", v7);
  os_unfair_lock_lock(p_lock);
  return v7;
}

- (id)object
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock_with_options();
  -[AMSThreadSafeObject underlyingObject](self, "underlyingObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock_with_options();
  -[AMSThreadSafeObject setUnderlyingObject:](self, "setUnderlyingObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_underlyingObject, 0);
}

@end
