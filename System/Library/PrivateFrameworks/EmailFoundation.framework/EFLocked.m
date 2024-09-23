@implementation EFLocked

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

- (void)performWhileLocked:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v5)(id, id);

  p_lock = &self->_lock;
  v5 = (void (**)(id, id))a3;
  os_unfair_lock_lock(p_lock);
  v5[2](v5, self->_object);

  os_unfair_lock_unlock(p_lock);
}

- (id)getObject
{
  os_unfair_lock_s *p_lock;
  char v4;
  id object;
  id v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_opt_respondsToSelector();
  object = self->_object;
  if ((v4 & 1) != 0)
    v6 = (id)objc_msgSend(object, "copyWithZone:", 0);
  else
    v6 = object;
  v7 = v6;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (EFLocked)initWithObject:(id)a3
{
  id v5;
  EFLocked *v6;
  EFLocked *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFLocked;
  v6 = -[EFLocked init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong(&v6->_object, a3);
  }

  return v7;
}

- (id)replaceObject:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  id object;
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_object;
  object = self->_object;
  self->_object = v4;
  v8 = v4;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)setObject:(id)a3
{
  id v4;
  id object;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  object = self->_object;
  self->_object = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EFLocked;
  -[EFLocked description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_object, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EFLocked;
  -[EFLocked description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_object, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (os_unfair_lock_s)unfairLockForTesting
{
  return &self->_lock;
}

@end
