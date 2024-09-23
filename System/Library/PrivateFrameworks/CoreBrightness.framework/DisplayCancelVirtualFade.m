@implementation DisplayCancelVirtualFade

double __DisplayCancelVirtualFade_block_invoke(uint64_t a1)
{
  double result;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v5;
  uint8_t v7[7];
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  if ((_DisplayRampIsRunning(*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v9 = 0;
    if (_logHandle)
    {
      v5 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v5 = inited;
    }
    v9 = v5;
    v8 = 2;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      log = v9;
      type = v8;
      __os_log_helper_16_0_0(v7);
      _os_log_debug_impl(&dword_1B5291000, log, type, "cancel ramp", v7, 2u);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1492) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1488);
    __DisplaySetVirtualBrightnessWithFadeInternal(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1488), 0.0, 0, 0, 0);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1472))
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 1472))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1480));
    result = 0.0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1440) = 0;
  }
  return result;
}

@end
