@implementation PBA

BOOL __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PBADeviceUnlockViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    NSClassFromString(CFSTR("PBADataRecoveryViewController"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_6;
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 1;
LABEL_6:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    v5 = 1;
  else
    v5 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;

  return v5;
}

uint64_t __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_homeButtonPressed:", 0);
}

uint64_t __63__PBA_SBUICallToActionLabelAccessibility_accessibilityActivate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pushPasscodeView");
}

@end
