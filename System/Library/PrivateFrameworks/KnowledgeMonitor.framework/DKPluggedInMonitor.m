@implementation DKPluggedInMonitor

uint64_t __28___DKPluggedInMonitor_start__block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 152))
  {
    v1 = result;
    _DKPluggedInMonitorLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_219056000, v2, OS_LOG_TYPE_INFO, "Received notification for adapter change", v3, 2u);
    }

    return objc_msgSend(*(id *)(v1 + 32), "setCurrentState");
  }
  return result;
}

@end
