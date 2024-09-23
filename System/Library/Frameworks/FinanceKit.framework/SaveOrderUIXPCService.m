@implementation SaveOrderUIXPCService

- (void)added
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(_QWORD *)self->continuationState;
  v3 = v2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_23360FCE4(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
}

- (void)cancelled
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(_QWORD *)self->continuationState;
  v3 = v2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  swift_retain();
  os_unfair_lock_lock(v4);
  sub_23360FCE4(v3);
  os_unfair_lock_unlock(v4);
  swift_release();
}

- (void)failedWith:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  id v6;

  v3 = *(_QWORD *)self->continuationState;
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  v6 = a3;
  swift_retain();
  os_unfair_lock_lock(v5);
  sub_23360FCE4(v4);
  os_unfair_lock_unlock(v5);
  swift_release();

}

@end
