@implementation _BSNSXPCInvalidCallbackTracking

- (os_unfair_lock_s)isInvalidationStillPending
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;

  v1 = a1;
  if (a1)
  {
    v2 = a1 + 4;
    os_unfair_lock_lock(a1 + 4);
    v1 = (os_unfair_lock_s *)(*(_QWORD *)&v1[2]._os_unfair_lock_opaque != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)clearPendingInvalidation
{
  os_unfair_lock_s *v2;
  void *v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    os_unfair_lock_unlock(v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_handler, 0);
}

@end
