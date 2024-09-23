@implementation DisplaySetCabalFactorOverride

void __DisplaySetCabalFactorOverride_block_invoke(uint64_t a1)
{
  uint64_t inited;
  NSObject *v2;
  float v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = *(float *)(a1 + 40);
  if (v4 >= 0.0)
    v4 = (float)(clamp(*(float *)(a1 + 40), 1.0, 16.0) - 1.0) / 15.0;
  *(float *)(*(_QWORD *)(a1 + 32) + 12468) = v4;
  if (_logHandle)
  {
    v2 = _logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v2 = inited;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_0((uint64_t)v5, (uint64_t)"CabalFactorOverride", COERCE__INT64(v4));
    _os_log_impl(&dword_1B5291000, v2, OS_LOG_TYPE_DEFAULT, "%s = %f\n", v5, 0x16u);
  }
  if (v4 >= 0.0)
    __DisplaySetAAPFactor(*(_BYTE **)(a1 + 32), v4);
}

@end
