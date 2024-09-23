@implementation DisplayCancelRestrictionFactorFade

uint64_t __DisplayCancelRestrictionFactorFade_block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v9;
  uint8_t v11[15];
  char v12;
  NSObject *v13;
  double *v14;
  uint8_t v15[15];
  char v16;
  NSObject *v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a1;
  v19 = a1;
  result = _DisplayRampIsRunning(*(_QWORD *)(a1 + 32));
  if ((result & 1) != 0)
  {
    v18 = 0;
    v18 = (double *)(*(_QWORD *)(a1 + 32) + 1064);
    if (__DisplayFactorFade_IsRunning(v18)
      && (!*(_DWORD *)(a1 + 40) || __DisplayFactorFade_Direction((uint64_t)v18) == *(_DWORD *)(a1 + 40)))
    {
      v17 = 0;
      if (_logHandle)
      {
        v9 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v9 = inited;
      }
      v17 = v9;
      v16 = 2;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        log = v17;
        type = v16;
        __os_log_helper_16_0_0(v15);
        _os_log_debug_impl(&dword_1B5291000, log, type, "Cancelling right restiction factor ramp", v15, 2u);
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1056) = *((_DWORD *)v18 + 5);
      __DisplayFactorFade_Cancel((uint64_t)v18);
    }
    v14 = 0;
    v14 = (double *)(*(_QWORD *)(a1 + 32) + 992);
    result = __DisplayFactorFade_IsRunning(v14);
    if ((result & 1) != 0)
    {
      if (!*(_DWORD *)(a1 + 40)
        || (result = __DisplayFactorFade_Direction((uint64_t)v14), (_DWORD)result == *(_DWORD *)(a1 + 40)))
      {
        v13 = 0;
        if (_logHandle)
        {
          v5 = _logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v4 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v4 = init_default_corebrightness_log();
          v5 = v4;
        }
        v13 = v5;
        v12 = 2;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          v2 = v13;
          v3 = v12;
          __os_log_helper_16_0_0(v11);
          _os_log_debug_impl(&dword_1B5291000, v2, v3, "Cancelling left restriction factor ramp", v11, 2u);
        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 984) = *((_DWORD *)v14 + 5);
        return __DisplayFactorFade_Cancel((uint64_t)v14);
      }
    }
  }
  return result;
}

@end
