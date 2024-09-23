@implementation BLSHPendingBacklightRamp

- (BLSHPendingBacklightRamp)initWithBacklightRampBlock:(id)a3
{
  id v4;
  BLSHPendingBacklightRamp *v5;
  BLSHPendingBacklightRamp *v6;
  uint64_t v7;
  id lock_backlightRampBlock;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLSHPendingBacklightRamp;
  v5 = -[BLSHPendingBacklightRamp init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    lock_backlightRampBlock = v6->_lock_backlightRampBlock;
    v6->_lock_backlightRampBlock = (id)v7;

  }
  return v6;
}

- (BOOL)hasPendingRamp
{
  BLSHPendingBacklightRamp *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_backlightRampBlock != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)performBacklightRampIfNeededWithDuration:(double)a3
{
  os_unfair_lock_s *p_lock;
  void (**v6)(_QWORD, double);
  id lock_backlightRampBlock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void (**)(_QWORD, double))MEMORY[0x2199D2BD8](self->_lock_backlightRampBlock);
  lock_backlightRampBlock = self->_lock_backlightRampBlock;
  self->_lock_backlightRampBlock = 0;

  os_unfair_lock_unlock(p_lock);
  if (v6)
    v6[2](v6, a3);

  return v6 != 0;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v4 = (id)objc_msgSend(v3, "appendPointer:withName:", self->_lock_backlightRampBlock, CFSTR("backlightRamp"));
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_backlightRampBlock, 0);
}

@end
