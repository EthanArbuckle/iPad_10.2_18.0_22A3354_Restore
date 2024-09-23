@implementation NSProcessInfoGetPowerState

uint64_t ___NSProcessInfoGetPowerState_block_invoke()
{
  qos_class_t v0;
  NSObject *global_queue;
  uint64_t result;
  int out_token;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  out_token = 0;
  v0 = qos_class_main();
  global_queue = dispatch_get_global_queue(v0, 2uLL);
  result = notify_register_dispatch("com.apple.system.lowpowermode", &out_token, global_queue, &__block_literal_global_147);
  if (!(_DWORD)result)
  {
    +[_NSSwiftProcessInfo cancelPowerStateNotifyNotification](_NSSwiftProcessInfo, "cancelPowerStateNotifyNotification");
    return NSProcessInfoNotifyPowerState(out_token);
  }
  return result;
}

uint64_t ___NSProcessInfoGetPowerState_block_invoke_2(uint64_t a1, int a2)
{
  return NSProcessInfoNotifyPowerState(a2);
}

@end
