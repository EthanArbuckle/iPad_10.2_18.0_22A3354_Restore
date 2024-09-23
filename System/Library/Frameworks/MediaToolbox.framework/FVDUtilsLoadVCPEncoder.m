@implementation FVDUtilsLoadVCPEncoder

uint64_t __FVDUtilsLoadVCPEncoder_block_invoke()
{
  uint64_t result;
  void *v1;
  uint64_t (*v2)(void);
  char v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = FigServer_IsServerProcess();
  if (!(_DWORD)result)
  {
    v1 = dlopen("/System/Library/PrivateFrameworks/VideoProcessing.framework/VideoProcessing", 4);
    if (v1 && (v2 = (uint64_t (*)(void))dlsym(v1, "VPModuleInitialize")) != 0)
    {
      result = v2();
      v3 = 1;
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      result = fig_log_call_emit_and_clean_up_after_send_and_compose();
      v3 = 0;
    }
    FVDUtilsLoadVCPEncoder_success = v3;
  }
  return result;
}

@end
