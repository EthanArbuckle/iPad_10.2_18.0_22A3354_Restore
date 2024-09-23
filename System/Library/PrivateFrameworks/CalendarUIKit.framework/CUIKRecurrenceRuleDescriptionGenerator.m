@implementation CUIKRecurrenceRuleDescriptionGenerator

- (id)naturalLanguageDescriptionForRecurrenceRule:(id)a3 withStartDate:(id)a4
{
  return (id)objc_msgSend(a3, "humanReadableDescriptionWithStartDate:isConcise:", a4, 0);
}

@end
