@implementation DMContextPathCStr

void __DMContextPathCStr_block_invoke()
{
  uint64_t v0;
  const __CFString *v1;
  CFIndex v2;

  if (DMContextPath_onceToken != -1)
    dispatch_once(&DMContextPath_onceToken, &__block_literal_global_2);
  v1 = (const __CFString *)DMContextPath_retval;
  v2 = CFStringGetLength((CFStringRef)DMContextPath_retval) + 1;
  DMContextPathCStr_retval = (uint64_t)malloc_type_malloc(v2, 0x9239104AuLL);
  if (!CFStringGetCString(v1, (char *)DMContextPathCStr_retval, v2, 0x8000100u))
    _DMLogFunc(v0, 3, CFSTR("DMContextPathCStr CFStringGetCString failed to convert our path to a c string!"));
}

@end
