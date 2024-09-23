@implementation CLPermissiveTimer

- (void)invalidate
{
  objc_super v3;

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECE24CD8);
  v3.receiver = self;
  v3.super_class = (Class)CLPermissiveTimer;
  -[CLTimer invalidate](&v3, sel_invalidate);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24CD8);
}

- (void)shouldFire
{
  void *v3;
  void *v4;
  void (**v5)(void);

  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECE24CD8);
  -[CLPermissiveTimer dbgAssertInside](self, "dbgAssertInside");
  -[CLTimer handler](self, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CLTimer handler](self, "handler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void (**)(void))objc_msgSend(v4, "copy");

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24CD8);
    v5[2]();

  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECE24CD8);
  }
}

@end
