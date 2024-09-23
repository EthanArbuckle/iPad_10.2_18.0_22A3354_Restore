@implementation DisplaySetReflectedBrightnessWithFade

void __DisplaySetReflectedBrightnessWithFade_block_invoke(uint64_t a1)
{
  double v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t inited;
  NSObject *v7;
  float v9;
  double v10;
  float v11;
  uint8_t v12[48];
  uint8_t v13[48];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12248) & 1) != 0)
  {
    *(double *)(*(_QWORD *)(a1 + 32) + 1576) = *(float *)(a1 + 56);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1568) = *(_DWORD *)(a1 + 60);
    if (_logHandle)
    {
      v7 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v7 = inited;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_2_8_0_8_0((uint64_t)v14, COERCE__INT64(*(float *)(a1 + 60)), COERCE__INT64(*(float *)(a1 + 56)));
      _os_log_debug_impl(&dword_1B5291000, v7, OS_LOG_TYPE_DEBUG, "reflected=%f fadePeriod=%f\n", v14, 0x16u);
    }
    if (*(double *)(*(_QWORD *)(a1 + 32) + 1576) == 0.0)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1572) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1568);
      if (*(float *)(*(_QWORD *)(a1 + 32) + 1572) == 0.0)
        v11 = 0.0;
      else
        v11 = _DisplayReflectedLuminanceToPerceptualLuminanceInternal(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1572));
      *(float *)(*(_QWORD *)(a1 + 32) + 1600) = v11;
      *(float *)(*(_QWORD *)(a1 + 32) + 1592) = v11;
      *(float *)(*(_QWORD *)(a1 + 32) + 1596) = v11;
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 12282) & 1) == 0)
        __DisplayUpdateAAPFactor(*(_QWORD *)(a1 + 32));
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(_QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48));
    }
    else if (*(float *)(*(_QWORD *)(a1 + 32) + 1572) != *(float *)(*(_QWORD *)(a1 + 32) + 1568))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608) = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1616) = *(_QWORD *)(a1 + 48);
      *(CFAbsoluteTime *)(*(_QWORD *)(a1 + 32) + 1584) = CFAbsoluteTimeGetCurrent();
      v10 = *(float *)(*(_QWORD *)(a1 + 32) + 12488);
      if (v10 == 0.0)
        v10 = 0.100000001;
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
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v13, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 1572)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 1568)), COERCE__INT64(*(float *)(a1 + 56)), COERCE__INT64(1.0 / v10));
        _os_log_debug_impl(&dword_1B5291000, v5, OS_LOG_TYPE_DEBUG, "begin ramp Lr: %0.2f -> Lr: %0.2f t: %f %0.2fhz", v13, 0x2Au);
      }
      if (_logHandle)
      {
        v3 = _logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v2 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v2 = init_default_corebrightness_log();
        v3 = v2;
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_0_4_8_0_8_0_8_0_8_0((uint64_t)v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1576), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1584), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 12480), *(uint64_t *)&v10);
        _os_log_debug_impl(&dword_1B5291000, v3, OS_LOG_TYPE_DEBUG, "fadePeriod=%f startTime=%f display->fade.timer=%p interval=%f\n", v12, 0x2Au);
      }
      if (*(float *)(*(_QWORD *)(a1 + 32) + 1572) == 0.0)
        v9 = 0.0;
      else
        v9 = _DisplayReflectedLuminanceToPerceptualLuminanceInternal(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1572));
      *(float *)(*(_QWORD *)(a1 + 32) + 1600) = v9;
      *(float *)(*(_QWORD *)(a1 + 32) + 1596) = v9;
      *(float *)(*(_QWORD *)(a1 + 32) + 1592) = _DisplayReflectedLuminanceToPerceptualLuminanceInternal(*(_QWORD *)(a1 + 32), fmaxf(*(float *)(*(_QWORD *)(a1 + 32) + 1568), 0.01));
      HIDWORD(v1) = HIDWORD(v10);
      *(float *)&v1 = v10;
      __DisplayStartFade(*(_BYTE **)(a1 + 32), v1);
    }
  }
}

@end
