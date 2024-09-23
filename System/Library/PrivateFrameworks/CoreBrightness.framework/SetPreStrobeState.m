@implementation SetPreStrobeState

void __SetPreStrobeState_block_invoke(uint64_t a1)
{
  id v1;
  double v2;
  uint64_t inited;
  NSObject *v4;
  void *v6;
  void *v7;
  float v8;
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v8 = *(float *)(*(_QWORD *)(a1 + 32) + 1520);
    if ((*(_BYTE *)(a1 + 40) & 1) != 0)
      v8 = 1.0;
    v1 = objc_alloc(MEMORY[0x1E0CB37E8]);
    *(float *)&v2 = v8;
    v7 = (void *)objc_msgSend(v1, "initWithFloat:", v2);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("Scaler"), 0);

    (*(void (**)(_QWORD, const __CFString *, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("UpdateDigitalDimmingBrightnessScaler"), v6);
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
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_1_8_0((uint64_t)v9, COERCE__INT64(v8));
      _os_log_debug_impl(&dword_1B5291000, v4, OS_LOG_TYPE_DEBUG, "Pre-strobe: setting Scalar=%f\n", v9, 0xCu);
    }
  }
}

@end
