@implementation NSDate(BaseBoard)

- (id)bs_dateByAddingDays:()BaseBoard
{
  CFCalendarRef v5;
  __CFCalendar *v6;
  CFAbsoluteTime v7;
  void *v8;
  CFAbsoluteTime at;

  v5 = CFCalendarCopyCurrent();
  if (!v5)
    return 0;
  v6 = v5;
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  at = v7;
  if (CFCalendarAddComponents(v6, &at, 0, "d", a3))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", at);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

@end
