@implementation SecCFCalendarGetZulu

void __SecCFCalendarGetZulu_block_invoke()
{
  const __CFAllocator *v0;
  const __CFTimeZone *v1;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  sZuluCalendar = (uint64_t)CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFCalendarIdentifier)*MEMORY[0x1E0C9B008]);
  v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(v0, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)sZuluCalendar, v1);
  if (v1)
    CFRelease(v1);
}

@end
