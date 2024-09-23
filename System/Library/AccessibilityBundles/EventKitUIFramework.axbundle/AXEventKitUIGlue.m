@implementation AXEventKitUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_246, 0, &__block_literal_global_252);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXEventKitUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __49__AXEventKitUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("EKDayOccurrenceView"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKEventDetailTitleCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKEvent"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKDayGridView"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKCalendarChooserCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKDayViewContent"));
  objc_msgSend(v2, "validateClass:", CFSTR("EKDayTimeView"));
  objc_msgSend(v2, "validateClass:", CFSTR("CalendarNotesCell"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("EKCalendarChooserCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayView"), CFSTR("_displayDate"), "NSDateComponents");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKEventDetailAttendeesListView"), CFSTR("_ungrouped"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewContent"), CFSTR("_startDate"), "EKCalendarDate");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayViewContent"), CFSTR("_dayStarts"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayOccurrenceView"), CFSTR("_startResizeHandle"), "UIView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("EKDayOccurrenceView"), CFSTR("_endResizeHandle"), "UIView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarItem"), CFSTR("calendar"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendar"), CFSTR("source"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKSource"), CFSTR("isFacebookSource"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarChooserCell"), CFSTR("checked"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKCalendarChooserCell"), CFSTR("showCheckmarksOnLeft"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayGridView"), CFSTR("hourHeight"), "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKDayGridView"), CFSTR("topPadding"), "d", 0);
  objc_msgSend(v2, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EKEventGestureControllerDelegate"), CFSTR("eventGestureController:heightForOccurrenceViewOfDuration:"));

  return 1;
}

uint64_t __49__AXEventKitUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("EventKit UI AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("EventKit UI"));

  return AXPerformValidationChecks();
}

void __49__AXEventKitUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CalendarNotesCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDateTimeCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDetailTextCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDetailTitleCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayOccurrenceViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayGridViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayViewContentAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayOccurrenceResizeHandleViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDetailAttendeesCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CalendarMessageUIProxyAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventGestureControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDetailCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKExpandingTextViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKCalendarChooserCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKCalendarItemEditorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDateEditItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIScrollViewAccessibility_EventKit_UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreferencesDoubleTwoPartValueCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreferencesTwoPartValueCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TwoPartTextLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayAllDayViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventViewControllerDefaultImplAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIInviteesViewInviteesCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIEventInviteesViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayViewContentItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIInviteesViewTimeSlotCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIYearMonthViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventEstimatedTravelTimeResultCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKDayPreviewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKCalendarItemCalendarEditItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventCalendarDetailItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventDetailURLCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventMapCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKCurrentTimeMarkerViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKTextViewWithLabelTextMetricsAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKCalendarItemLocationInlineEditItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventAttachmentsEditItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIDividedGridViewTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIDividedGridViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventConferenceInformationDetailItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUITableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventEditorAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UILabelAccessibility__EventKitUI__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKEventEditViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIAvailabilityViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIAvailabilityFreeSpanViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIParticipantContainerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIPopupTableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DayTwoPartLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKUIListViewTimedEventCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("EKReminderTitleDetailCellAccessibility"), 1);

}

@end
