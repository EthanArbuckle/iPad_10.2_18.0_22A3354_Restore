@implementation NSProcessInfo

uint64_t __63__NSProcessInfo_MTLDeviceCertification__hasPerformanceProfile___block_invoke()
{
  const char *v0;
  NSObject *global_queue;

  v0 = (const char *)kSemNotification;
  global_queue = dispatch_get_global_queue(0, 0);
  return notify_register_dispatch(v0, &_semNotifyToken, global_queue, &__block_literal_global_6);
}

uint64_t __63__NSProcessInfo_MTLDeviceCertification__hasPerformanceProfile___block_invoke_2()
{
  uint64_t result;
  uint64_t v1;
  void *v2;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(_semNotifyToken, &state64);
  v1 = _semState;
  _semState = state64;
  if (state64 != v1)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    return objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.system.performance_profile_changed"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", state64 != 0));
  }
  return result;
}

@end
