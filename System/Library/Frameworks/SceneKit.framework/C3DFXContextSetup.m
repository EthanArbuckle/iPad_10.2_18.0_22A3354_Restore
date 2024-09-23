@implementation C3DFXContextSetup

uint64_t __C3DFXContextSetup_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *Light;
  uint64_t v5;
  const void *Technique;
  const void *SpotShadow;
  NSObject *v8;

  Light = C3DNodeGetLight(a2);
  if (Light)
  {
    v5 = (uint64_t)Light;
    Technique = (const void *)C3DLightGetTechnique((uint64_t)Light);
    if (Technique)
    {
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), Technique);
    }
    else if (C3DLightGetCastsShadow(v5) && C3DLightGetUsesDeferredShadows(v5))
    {
      if ((C3DLightGetType(v5) & 0xFFFFFFFD) == 1)
      {
        SpotShadow = (const void *)C3DFXTechniqueCreateSpotShadow(a2);
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), SpotShadow);
        CFRelease(SpotShadow);
      }
      else
      {
        v8 = scn_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __C3DFXContextSetup_block_invoke_cold_1();
      }
    }
  }
  return 0;
}

void __C3DFXContextSetup_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_1DCCB8000, v0, v1, "Error: shadows are only supported by spot lights and directional lights", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
