@implementation DACustomLogDirectory

CFTypeRef __DACustomLogDirectory_block_invoke()
{
  CFTypeRef result;

  result = CFRetain(CFSTR("/var/mobile/Library/Logs/CrashReporter/Reminders"));
  DACustomLogDirectory_retval = (uint64_t)result;
  return result;
}

@end
