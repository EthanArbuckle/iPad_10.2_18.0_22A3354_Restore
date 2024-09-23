@implementation AXMobileCalGlue

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
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_259, 0, &__block_literal_global_265);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMobileCalGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_351, CFSTR("AddressBookUI"));

  }
}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CUIKCalendarModel"));
  objc_msgSend(v2, "validateClass:", CFSTR("PreferencesDoubleTwoPartValueCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("PreferencesTwoPartValueCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("ListViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("TwoPartTextLabel"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PreferencesTwoPartValueCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekView"), CFSTR("_allDayView"), "WeekAllDayView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("ListViewController"), CFSTR("_model"), "CUIKCalendarModel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoPartTextLabel"), CFSTR("_secondTextPart"), "NSString");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("cachedOccurrenceAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("eventStore"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("occurrencesForDay: waitForLoad:"), "@", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("selectedCalendars"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKCalendarModel"), CFSTR("setSelectedDate:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKOccurrencesCollection"), CFSTR("occurrences"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CUIKOccurrencesCollection"), CFSTR("allDayOccurrences"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesDoubleTwoPartValueCell"), CFSTR("textLabel2"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesDoubleTwoPartValueCell"), CFSTR("twoPartTextLabel2"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreferencesTwoPartValueCell"), CFSTR("twoPartTextLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ListViewController"), CFSTR("tableView: viewForHeaderInSection:"), "@", "@", "q", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("ListViewController"), CFSTR("MainViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainViewController"), CFSTR("model"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSCalendar"), CFSTR("components: fromDate:"), "@", "Q", "@", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("NSCalendar"), CFSTR("calendarWithIdentifier:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("WeekGroupView"));
  objc_msgSend(v2, "validateClass:", CFSTR("WeekViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("WeekViewController"), CFSTR("_eventGestureController"), "EKEventGestureController");
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CUIKDateStrings"), CFSTR("overlayShortStringForDate: inCalendar:"), "@", "@", "@", 0);

  return 1;
}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("MobileCal AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileCal"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CUIKCalendarModelAccessibility__MobileCal__CalendarUIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DayNavigationWeekScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DayNavigationViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DayNavigationViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("InfiniteScrollViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileCalUIAccessibilityElementMockViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileCalUIScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MonthViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeMonthViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactMonthViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeMonthWeekViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeWeekViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactWidthMonthViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactMonthWeekDayNumberAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactMonthWeekTodayCircleAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactMonthWeekViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RootNavigationControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ListViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WeekAllDayViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WeekDayInitialsHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WeekTimeViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WeekViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WeekViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("YearViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("YearViewYearHeaderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MainViewControllerContainerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SearchResultsViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ListTableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("YearMonthAnimatorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileCalUIDimmingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileCalUIViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileCalUITransitionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CompactDayNavigationViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeDayNavigationViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SplashScreenViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MainWindowControlHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MainWindowRootViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MainWindowContentContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeTextLargeMonthWeekViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LargeYearMonthViewAccessibility"), 1);

}

uint64_t __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __48__AXMobileCalGlue_accessibilityInitializeBundle__block_invoke_5()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AddressBookUI"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

@end
