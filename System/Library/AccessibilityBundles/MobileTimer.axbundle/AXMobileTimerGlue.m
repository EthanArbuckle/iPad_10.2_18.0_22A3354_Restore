@implementation AXMobileTimerGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_293, 0, &__block_literal_global_299);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobileTimerGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_369, CFSTR("Weather"));

  }
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MTUIDigitalClockLabel"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTATimeView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTATableViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTATimerViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTUIAnalogClockView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTTimerManager"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTAStopwatchViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MTUIDigitalClockLabel"), CFSTR("MTUIDateLabel"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MTAAlarmTableViewCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MTATimeView"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("UISegmentedControl"), CFSTR("_segments"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("pauseLapTimer"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("startLapTimer"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("resumeLapTimer"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("startUpdatingTimerUI"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("stopUpdatingTimerUI"), "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATableViewController"), CFSTR("_numberOfItemsDidChangeAnimated:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("repeatText"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("enabledSwitch"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAlarmView"), CFSTR("timeLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("pauseResumeTimer:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerViewController"), CFSTR("startTimer:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAnalogClockView"), CFSTR("isNighttime"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAnalogClockView"), CFSTR("hour"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIAnalogClockView"), CFSTR("minute"), "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("toolbarItems"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("Alarm"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTAWorldClockMapView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTAWorldClockMapCityView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTAWorldClockPadViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("MTAWorldClockView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPickerCell"), CFSTR("picker"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTATimerPickerCell"), CFSTR("timeView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAWorldClockMapCityView"), CFSTR("_nameLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAWorldClockMapCityView"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MTAWorldClockTableViewCell"), CFSTR("_clockCellView"), "MTUIWorldClockCellView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MTUIAnalogClockView"), CFSTR("_nighttime"), "B");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("nameLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("combinedLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Alarm"), CFSTR("isActive"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Alarm"), CFSTR("hour"), "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Alarm"), CFSTR("minute"), "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockMapCityView"), CFSTR("city"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockMapView"), CFSTR("addCity:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockMapView"), CFSTR("removeCity:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAWorldClockView"), CFSTR("analogClock"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("didAddLap:"), "v", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTAStopwatchViewController"), CFSTR("lapLapTimer"), "v", 0);

  return 1;
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Clock"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileTimer AX Bundle"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileTimerUIButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileTimerUILabelAccessiblity"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAStopwatchViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTACircleButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerPickerCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerControlsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerButtonsControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockMapViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockMapCityViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockPadViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockCollectionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MT_UICollectionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAStopwatchTableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAStopwatchLapCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAWorldClockCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAlarmCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAEditAlarmVolumeCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MT_UIPageControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerIntervalPickerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAlarmEditViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAlarmTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAlarmTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAppControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTAAlarmCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTACountDownPickerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerPresetViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerCellViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MTATimerRecentViewAccessibility"), 1);

}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_371, &__block_literal_global_378, &__block_literal_global_382);

}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("City"), CFSTR("temperature"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("City"), CFSTR("conditionCode"), "q", 0);

  return 1;
}

uint64_t __50__AXMobileTimerGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setValidationTargetName:", CFSTR("MobileTimer - Weather Combo Framework AX Bundle"));
  return AXPerformValidationChecks();
}

+ (void)playStopSound
{
  SystemSoundID v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFURL *v6;

  v2 = playStopSound_StopSound;
  if (!playStopSound_StopSound)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimer.axbundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("timer-stop"), CFSTR("aiff"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    AudioServicesCreateSystemSoundID(v6, (SystemSoundID *)&playStopSound_StopSound);
    v2 = playStopSound_StopSound;
  }
  AudioServicesPlaySystemSound(v2);
}

+ (void)playStartSound
{
  SystemSoundID v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFURL *v6;

  v2 = playStartSound_StartSound;
  if (!playStartSound_StartSound)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MobileTimer.axbundle"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v3, "pathForResource:ofType:", CFSTR("timer-start"), CFSTR("aiff"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

    AudioServicesCreateSystemSoundID(v6, (SystemSoundID *)&playStartSound_StartSound);
    v2 = playStartSound_StartSound;
  }
  AudioServicesPlaySystemSound(v2);
}

@end
