@implementation BSMutableAnimationSettings

- (void)setTimingFunction:(id)a3
{
  -[BSAnimationSettings _setTimingFunction:]((uint64_t)self, a3);
}

- (void)setDelay:(double)a3
{
  os_unfair_lock_s *p_lock;

  if (self)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_delay = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;

  if (self)
  {
    p_lock = &self->super._lock;
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_highFrameRateReason = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setDuration:(double)a3
{
  void *v5;

  if (self)
  {
    if (self->super._isSpring)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel__setDuration_, self, CFSTR("BSAnimationSettings.m"), 581, CFSTR("cannot set duration on a spring animation"));

    }
    os_unfair_lock_lock(&self->super._lock);
    self->super._lock_storedDuration = a3;
    os_unfair_lock_unlock(&self->super._lock);
  }
}

@end
