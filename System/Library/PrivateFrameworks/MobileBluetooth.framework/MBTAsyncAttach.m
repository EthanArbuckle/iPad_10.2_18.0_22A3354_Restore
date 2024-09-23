@implementation MBTAsyncAttach

uint64_t ___MBTAsyncAttach_block_invoke(uint64_t a1)
{
  uint64_t result;

  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEBUG))
    ___MBTAsyncAttach_block_invoke_cold_1();
  result = _MBTSignalSessionEvent(*(_QWORD *)(a1 + 32), 0, 0);
  gSessionAttachTries = 0;
  return result;
}

void ___MBTAsyncAttach_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_1B6BF1000, v0, v1, "MBFXPC LOG Signalling BT_SESSION_ATTACHED SUCCESS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
