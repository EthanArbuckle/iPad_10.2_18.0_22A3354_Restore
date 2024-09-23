@implementation DisplayStartRTPLCEDRCapRamp

void __DisplayStartRTPLCEDRCapRamp_block_invoke(uint64_t a1)
{
  double v1;
  const char *v2;
  uint64_t inited;
  NSObject *v4;
  float v5;
  int v7;
  double v8;
  float v9;
  uint8_t v10[88];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(a1 + 52) & 1) != 0)
  {
    v9 = *(float *)(a1 + 40);
  }
  else
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12704) & 1) != 0)
      v5 = *(float *)(*(_QWORD *)(a1 + 32) + 12676);
    else
      v5 = *(float *)(a1 + 40);
    v9 = v5;
  }
  v8 = (float)(fabsf(log2f(*(float *)(a1 + 44) / v9)) * *(float *)(a1 + 48));
  if (v8 <= 0.0)
  {
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1328) | 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12672) = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12676) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12672);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 12656) = 0;
    __DisplaySetLogicalBrightnessInternal(*(const void **)(a1 + 32), v7 | 0x40, *(float *)(*(_QWORD *)(a1 + 32) + 1256));
  }
  else
  {
    *(double *)(*(_QWORD *)(a1 + 32) + 12656) = v8;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12672) = *(_DWORD *)(a1 + 44);
    *(float *)(*(_QWORD *)(a1 + 32) + 12680) = v9;
    *(float *)(*(_QWORD *)(a1 + 32) + 12676) = v9;
    *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 12664) = CFAbsoluteTimeGetCurrent();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 12688) = 0;
    if (_logHandle)
    {
      v4 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v4 = inited;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v2 = "YES";
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12704) & 1) == 0)
        v2 = "NO";
      __os_log_helper_16_2_8_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_32((uint64_t)v10, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 12680)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 12672)), *(uint64_t *)&v8, COERCE__INT64(*(float *)(a1 + 40)), COERCE__INT64(v9), COERCE__INT64(*(float *)(a1 + 44)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 12676)), (uint64_t)v2);
      _os_log_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEFAULT, "HDR RTPLC CAP: \n\tFADE: %f --------> %f, duration: %f, \n\tstart:%f, \n\thStart:%f, \n\ttarget:%f, \n\tdisplay->rtplcEDRFade.fade.Hcurrent: %f\n\trtplcFadeIsRunning: %s", v10, 0x52u);
    }
    LODWORD(v1) = 1007192201;
    __DisplayStartFade(*(_BYTE **)(a1 + 32), v1);
  }
}

@end
