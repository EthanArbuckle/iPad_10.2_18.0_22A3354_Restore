@implementation HDMILatencyMgr

void __HDMILatencyMgr_UpdateMeasuredHDMILatency_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v3;
  const void *v4;
  const void *v5;

  if (dword_1EE2B3FC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (const void *)qword_1EE2B3FD8;
  v4 = *(const void **)(a1 + 32);
  qword_1EE2B3FD8 = (uint64_t)v4;
  if (v4)
    CFRetain(v4);
  if (v3)
    CFRelease(v3);
  updateMeasuredHDMILatencyOnCoreAnimationAndHAL();
  writeMeasuredHDMILatencyToDisk((const void *)qword_1EE2B3FD8);
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

uint64_t __HDMILatencyMgr_UpdateCurrentRefreshRate_block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3FC8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  qword_1EE2B3FE8 = *(_QWORD *)(a1 + 32);
  updateMeasuredHDMILatencyOnCoreAnimationAndHAL();
  return writeMeasuredHDMILatencyToDisk((const void *)qword_1EE2B3FD8);
}

CFDictionaryRef __HDMILatencyMgr_CopyMeasuredHDMILatency_block_invoke(uint64_t a1)
{
  const __CFDictionary *v2;
  CFDictionaryRef result;

  v2 = (const __CFDictionary *)qword_1EE2B3FD8;
  if (qword_1EE2B3FD8
    || (result = copyMeasuredHDMILatencyFromDisk(), v2 = result, (qword_1EE2B3FD8 = (uint64_t)result) != 0))
  {
    result = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end
