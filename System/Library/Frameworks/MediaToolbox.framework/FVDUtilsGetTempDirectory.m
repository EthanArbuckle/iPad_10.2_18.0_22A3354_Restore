@implementation FVDUtilsGetTempDirectory

uint64_t __FVDUtilsGetTempDirectory_block_invoke()
{
  const __CFString *v0;
  NSString *v1;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v0 = (const __CFString *)FigVirtualDisplayPrefsCopyValue(CFSTR("fvd_tempdir_path"));
  if (!v0)
  {
    v1 = NSTemporaryDirectory();
    if (v1)
      v0 = (const __CFString *)v1;
    else
      v0 = CFSTR("/tmp");
    CFRetain(v0);
  }
  FVDUtilsGetTempDirectory_tmpDir = (uint64_t)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@/"), v0);
  CFRelease(v0);
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  return fig_log_call_emit_and_clean_up_after_send_and_compose();
}

@end
