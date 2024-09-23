@implementation HMMutableHomeManagerConfiguration

- (void)setDiscretionary:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->super._discretionary = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setAdaptive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->super._adaptive = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __HMHomeManagerConfigurationCreateCopy(self, 0, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)cachePolicy
{
  os_unfair_lock_s *p_lock;
  unint64_t cachePolicy;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  cachePolicy = self->super._cachePolicy;
  os_unfair_lock_unlock(p_lock);
  return cachePolicy;
}

- (void)setCachePolicy:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->super._cachePolicy = a3;
  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)options
{
  os_unfair_lock_s *p_lock;
  unint64_t options;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  options = self->super._options;
  os_unfair_lock_unlock(p_lock);
  return options;
}

- (void)setOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->super._options = a3;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isDiscretionary
{
  HMMutableHomeManagerConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->super._discretionary;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)isAdaptive
{
  HMMutableHomeManagerConfiguration *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->super._adaptive;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSOperationQueue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  NSOperationQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->super._delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setDelegateQueue:(id)a3
{
  id v4;
  NSOperationQueue *v5;
  NSOperationQueue *v6;
  NSOperationQueue *delegateQueue;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v5 = (NSOperationQueue *)v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v5 = (NSOperationQueue *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  os_unfair_lock_lock_with_options();
  delegateQueue = self->super._delegateQueue;
  self->super._delegateQueue = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (HMFLocationAuthorization)locationAuthorization
{
  os_unfair_lock_s *p_lock;
  HMFLocationAuthorization *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->super._locationAuthorization;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setLocationAuthorization:(id)a3
{
  HMFLocationAuthorization *v4;
  HMFLocationAuthorization *locationAuthorization;
  id v6;

  v6 = a3;
  os_unfair_lock_lock_with_options();
  if (v6)
  {
    v4 = (HMFLocationAuthorization *)v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D285B8], "sharedAuthorization");
    v4 = (HMFLocationAuthorization *)objc_claimAutoreleasedReturnValue();
  }
  locationAuthorization = self->super._locationAuthorization;
  self->super._locationAuthorization = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  __HMHomeManagerConfigurationCreateCopy(self, 1, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

@end
