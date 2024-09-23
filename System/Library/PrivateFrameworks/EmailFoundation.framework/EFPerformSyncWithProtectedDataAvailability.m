@implementation EFPerformSyncWithProtectedDataAvailability

uint64_t __EFPerformSyncWithProtectedDataAvailability_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = EFProtectedDataAvailable();
  return (*(uint64_t (**)(uint64_t, _BOOL8))(v1 + 16))(v1, v2);
}

@end
