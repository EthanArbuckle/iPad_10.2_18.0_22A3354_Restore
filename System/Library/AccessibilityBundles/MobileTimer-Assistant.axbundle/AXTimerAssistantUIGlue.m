@implementation AXTimerAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_214, 0, &__block_literal_global_220);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXTimerAssistantUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MobileTimerAssistantAlarmSnippetCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("MobileTimerAssistantTimerSnippetCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("TimerSnippetTimeView"));
  objc_msgSend(v2, "validateClass:", CFSTR("SAAlarmObject"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TimerSnippetTimeView"), CFSTR("updateDisplayWithTime:"), "B", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("repeatText"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("enabledSwitch"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("combinedLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MobileTimerAssistantAlarmSnippetCell"), CFSTR("_alarmView"), "MTUIAlarmView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MobileTimerAssistantWorldClockSnippetCell"), CFSTR("_clockCellView"), "MTUIWorldClockCellView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TimerSnippetTimeView"), CFSTR("_running"), "c");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TimerSnippetTimeView"), CFSTR("_fireTime"), "d");

  return 1;
}

uint64_t __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Timer Assistant UI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Timer Assistant UI"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __55__AXTimerAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileTimerAssistantAlarmSnippetCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileTimerAssistantTimerSnippetCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileTimerAssistantWorldClockSnippetCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TimerSnippetTimeViewAccessibility"), 1);

}

@end
