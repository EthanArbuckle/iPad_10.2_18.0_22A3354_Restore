@implementation NSProcessInfoGetThermalState

uint64_t ___NSProcessInfoGetThermalState_block_invoke()
{
  const char *v0;
  qos_class_t v1;
  NSObject *global_queue;
  uint64_t result;
  int out_token;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  out_token = 0;
  v0 = (const char *)*MEMORY[0x1E0C83A00];
  v1 = qos_class_main();
  global_queue = dispatch_get_global_queue(v1, 2uLL);
  result = notify_register_dispatch(v0, &out_token, global_queue, &__block_literal_global_144);
  if (!(_DWORD)result)
  {
    +[_NSSwiftProcessInfo cancelThermalStateNotifyNotification](_NSSwiftProcessInfo, "cancelThermalStateNotifyNotification");
    return NSProcessInfoNotifyThermalState(out_token);
  }
  return result;
}

uint64_t ___NSProcessInfoGetThermalState_block_invoke_2(uint64_t a1, int a2)
{
  return NSProcessInfoNotifyThermalState(a2);
}

@end
