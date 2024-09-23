@implementation CalendarNotesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CalendarNotesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
