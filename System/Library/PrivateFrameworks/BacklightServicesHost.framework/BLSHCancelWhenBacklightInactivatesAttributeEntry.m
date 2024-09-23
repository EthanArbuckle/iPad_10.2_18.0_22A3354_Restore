@implementation BLSHCancelWhenBacklightInactivatesAttributeEntry

- (id)initForAttribute:(id)a3 fromAssertion:(id)a4 forService:(id)a5
{
  _DWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BLSHCancelWhenBacklightInactivatesAttributeEntry;
  v5 = -[BLSValidWhenBacklightInactiveAttributeEntry initForAttribute:fromAssertion:forService:](&v10, sel_initForAttribute_fromAssertion_forService_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5[10] = 0;
    v7 = objc_alloc_init(MEMORY[0x24BE0B848]);
    v8 = (void *)v6[4];
    v6[4] = v7;

    -[BLSHCancelWhenBacklightInactivatesAttributeEntry cancelIfNeededForBacklightState:]((uint64_t)v6, objc_msgSend(v7, "backlightState"));
  }
  return v6;
}

- (void)cancelIfNeededForBacklightState:(uint64_t)a1
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    v4 = *(unsigned __int8 *)(a1 + 44);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    if (a2 != 2)
    {
      if (v4)
      {
        objc_msgSend((id)a1, "service");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "assertion");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BDD1540];
        v8 = *MEMORY[0x24BE0B778];
        v11 = *MEMORY[0x24BDD0FC8];
        v12[0] = CFSTR("canceled due to backlight inactive");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 12, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "cancelAssertion:withError:", v6, v10);

      }
    }
  }
}

- (BOOL)reactivateIfPossible
{
  -[BLSHCancelWhenBacklightInactivatesAttributeEntry activate]((os_unfair_lock_s *)self);
  return 1;
}

- (os_unfair_lock_s)activate
{
  os_unfair_lock_s *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock(result + 10);
    LOBYTE(v1[11]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v1 + 10);
    return (os_unfair_lock_s *)objc_msgSend(*(id *)&v1[8]._os_unfair_lock_opaque, "addObserver:", v1);
  }
  return result;
}

- (void)deactivate
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObserver:", a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    *(_BYTE *)(a1 + 44) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (void)invalidate
{
  if (self)
    -[BLSHCancelWhenBacklightInactivatesAttributeEntry deactivate]((uint64_t)self);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvents:(id)a5 abortedEvents:(id)a6
{
  -[BLSHCancelWhenBacklightInactivatesAttributeEntry cancelIfNeededForBacklightState:]((uint64_t)self, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlight, 0);
}

@end
