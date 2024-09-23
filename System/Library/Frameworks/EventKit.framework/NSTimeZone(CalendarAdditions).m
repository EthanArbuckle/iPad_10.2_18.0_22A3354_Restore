@implementation NSTimeZone(CalendarAdditions)

+ (id)calendarTimeZone
{
  return (id)CalCopyTimeZone();
}

@end
