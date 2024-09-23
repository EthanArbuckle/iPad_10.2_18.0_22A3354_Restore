@implementation CNUsageReporting

+ (BOOL)isEnabled
{
  if (_CFMZEnabled())
    return 0;
  else
    return softLinkDiagnosticLogSubmissionEnabled();
}

@end
