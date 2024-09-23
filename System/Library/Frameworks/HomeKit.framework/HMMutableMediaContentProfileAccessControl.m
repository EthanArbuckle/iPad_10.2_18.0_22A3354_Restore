@implementation HMMutableMediaContentProfileAccessControl

- (void)setAccessories:(id)a3
{
  void *v4;
  void *v5;
  NSMutableSet *v6;
  NSMutableSet *internalAccessories;
  id v8;

  v8 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (void *)MEMORY[0x1E0C99E20];
  v5 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  internalAccessories = self->super._internalAccessories;
  self->super._internalAccessories = v6;

  os_unfair_lock_unlock(&self->super.super._lock);
}

- (void)addAccessory:(id)a3
{
  os_unfair_lock_s *v3;
  _Unwind_Exception *v5;
  id v6;

  v6 = a3;
  if (!+[HMMediaContentProfileAccessControl isAccessorySupported:](HMMediaContentProfileAccessControl, "isAccessorySupported:"))
  {
    v5 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v5);
  }
  os_unfair_lock_lock_with_options();
  -[NSMutableSet addObject:](self->super._internalAccessories, "addObject:", v6);
  os_unfair_lock_unlock(&self->super.super._lock);

}

- (void)removeAccessory:(id)a3
{
  os_unfair_lock_s *v3;
  _Unwind_Exception *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    v5 = (_Unwind_Exception *)_HMFPreconditionFailure();
    os_unfair_lock_unlock(v3);
    _Unwind_Resume(v5);
  }
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeObject:](self->super._internalAccessories, "removeObject:", v6);
  os_unfair_lock_unlock(&self->super.super._lock);

}

@end
