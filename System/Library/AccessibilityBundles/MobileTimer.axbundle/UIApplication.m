@implementation UIApplication

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "pauseLapTimer");
  result = +[AXMobileTimerGlue playStopSound](AXMobileTimerGlue, "playStopSound");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "startLapTimer");
  result = +[AXMobileTimerGlue playStartSound](AXMobileTimerGlue, "playStartSound");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "resumeLapTimer");
  result = +[AXMobileTimerGlue playStartSound](AXMobileTimerGlue, "playStartSound");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void __84__UIApplication_MobileTimerUIApplicationAccessibility__accessibilityPerformMagicTap__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  MEMORY[0x234916758](CFSTR("MTATimerViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("timerManager"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("getCurrentTimerSync"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("state"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "startTimer:", 0);
    }
    else
    {
      if (v5 != 2)
      {
        if (v5 == 3)
        {
          objc_msgSend(*(id *)(a1 + 32), "pauseResumeTimer:", 0);
          +[AXMobileTimerGlue playStopSound](AXMobileTimerGlue, "playStopSound");
        }
        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "pauseResumeTimer:", 0);
    }
    +[AXMobileTimerGlue playStartSound](AXMobileTimerGlue, "playStartSound");
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

@end
