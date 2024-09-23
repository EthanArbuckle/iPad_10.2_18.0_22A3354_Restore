@implementation HMMManagedEphemeralContainer

- (HMMManagedEphemeralContainer)initWithContainerName:(id)a3
{
  id v5;
  HMMManagedEphemeralContainer *v6;
  HMMManagedEphemeralContainer *v7;
  double v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMMManagedEphemeralContainer;
  v6 = -[HMMManagedEphemeralContainer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerName, a3);
    HMFUptime();
    v7->_startTime = v8;
    v7->_active = 1;
  }

  return v7;
}

- (double)activeDuration
{
  os_unfair_lock_s *p_lock;
  double v4;
  double activeDuration;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active)
  {
    HMFUptime();
    activeDuration = v4 - self->_startTime;
  }
  else
  {
    activeDuration = self->_activeDuration;
  }
  os_unfair_lock_unlock(p_lock);
  return activeDuration;
}

- (BOOL)isActive
{
  HMMManagedEphemeralContainer *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_active;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setActive:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  double v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_active)
  {
    HMFUptime();
    self->_activeDuration = v5 - self->_startTime;
    self->_active = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)containerName
{
  return self->_containerName;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end
