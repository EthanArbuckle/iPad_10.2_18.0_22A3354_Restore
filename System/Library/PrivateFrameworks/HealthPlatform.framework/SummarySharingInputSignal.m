@implementation SummarySharingInputSignal

- (void)sharingEntryStoreDidUpdate
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t (*v5)();

  v2 = *(os_unfair_lock_s **)self->lock;
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 18;
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_1BC744D20(v3, &v5);
  os_unfair_lock_unlock(v4);
  v5();
  swift_release();
  swift_release();
}

@end
