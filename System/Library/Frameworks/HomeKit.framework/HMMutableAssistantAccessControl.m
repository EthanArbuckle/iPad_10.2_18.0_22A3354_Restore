@implementation HMMutableAssistantAccessControl

- (BOOL)isEnabled
{
  HMMutableAssistantAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = *(&v2->super._enabled + 4);
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  *(&self->super._enabled + 4) = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)areActivityNotificationsEnabledForPersonalRequests
{
  HMMutableAssistantAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->super._activityNotificationsEnabledForPersonalRequests;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActivityNotificationsEnabledForPersonalRequests:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._activityNotificationsEnabledForPersonalRequests = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)options
{
  os_unfair_lock_s *p_lock;
  unint64_t options;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  options = self->super._options;
  os_unfair_lock_unlock(p_lock);
  return options;
}

- (void)setOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._options = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowUnauthenticatedRequests
{
  HMMutableAssistantAccessControl *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->super._options & 1;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setAllowUnauthenticatedRequests:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  self->super._options = self->super._options & 0xFFFFFFFFFFFFFFFELL | v3;
  os_unfair_lock_unlock(p_lock);
}

- (NSArray)accessories
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->super.super._lock;
  os_unfair_lock_lock_with_options();
  -[NSSet allObjects](self->super._accessories, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)setAccessories:(id)a3
{
  NSSet *v4;
  NSSet *accessories;
  HMMutableAssistantAccessControl *v6;
  SEL v7;
  id v8;
  id v9;

  v9 = a3;
  if ((__validateAccessories(v9) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    accessories = self->super._accessories;
    self->super._accessories = v4;

    os_unfair_lock_unlock(&self->super.super._lock);
  }
  else
  {
    v6 = (HMMutableAssistantAccessControl *)_HMFPreconditionFailure();
    -[HMMutableAssistantAccessControl addAccessory:](v6, v7, v8);
  }
}

- (void)addAccessory:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSSet *v7;
  NSSet *accessories;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = __validateAccessories(v5);

  if ((v6 & 1) == 0)
  {
    _HMFPreconditionFailure();
    __break(1u);
  }
  os_unfair_lock_lock_with_options();
  -[NSSet setByAddingObject:](self->super._accessories, "setByAddingObject:", v4);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  accessories = self->super._accessories;
  self->super._accessories = v7;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)removeAccessory:(id)a3
{
  os_unfair_lock_s *v3;
  id v5;
  void *v6;
  NSSet *v7;
  NSSet *accessories;
  _Unwind_Exception *v9;
  id v10;

  v5 = a3;
  if (!v5)
  {
    v9 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v9);
  }
  v10 = v5;
  os_unfair_lock_lock_with_options();
  if (-[NSSet containsObject:](self->super._accessories, "containsObject:", v10))
  {
    v6 = (void *)-[NSSet mutableCopy](self->super._accessories, "mutableCopy");
    objc_msgSend(v6, "removeObject:", v10);
    v7 = (NSSet *)objc_msgSend(v6, "copy");
    accessories = self->super._accessories;
    self->super._accessories = v7;

  }
  os_unfair_lock_unlock(&self->super.super._lock);

}

- (id)copyWithZone:(_NSZone *)a3
{
  HMAssistantAccessControl *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = +[HMAssistantAccessControl allocWithZone:](HMAssistantAccessControl, "allocWithZone:");
  -[HMAccessControl user](self, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMAssistantAccessControl initWithUser:](v5, "initWithUser:", v6);

  *(_BYTE *)(v7 + 36) = -[HMMutableAssistantAccessControl isEnabled](self, "isEnabled");
  *(_QWORD *)(v7 + 40) = -[HMMutableAssistantAccessControl options](self, "options");
  *(_BYTE *)(v7 + 56) = -[HMMutableAssistantAccessControl areActivityNotificationsEnabledForPersonalRequests](self, "areActivityNotificationsEnabledForPersonalRequests");
  v8 = -[NSSet copyWithZone:](self->super._accessories, "copyWithZone:", a3);
  v9 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v8;

  return (id)v7;
}

@end
