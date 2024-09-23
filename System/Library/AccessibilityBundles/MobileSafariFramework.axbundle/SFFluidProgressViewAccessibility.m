@implementation SFFluidProgressViewAccessibility

void __68___SFFluidProgressViewAccessibility__finishProgressBarWithDuration___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], &unk_25029DDD8);
}

uint64_t __95___SFFluidProgressViewAccessibility_fluidProgressController_updateFluidProgressBar_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoolValueForKey:", CFSTR("StartedFluidProgress"));
  if ((_DWORD)result)
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2327A6000, v3, OS_LOG_TYPE_INFO, "Posting fallback finish notification in case we get no other updates", v4, 2u);
    }

    UIAccessibilityPostNotification(*MEMORY[0x24BEBB1F8], &unk_25029DDD8);
    return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 0, CFSTR("StartedFluidProgress"));
  }
  return result;
}

uint64_t __53___SFFluidProgressViewAccessibility__axCheckProgress__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axCheckProgress");
}

uint64_t __99___SFFluidProgressViewAccessibility_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axCheckProgress");
}

@end
