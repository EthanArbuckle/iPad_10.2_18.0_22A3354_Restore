@implementation CSPhoneCallStateMonitor

+ (id)sharedInstance
{
  __assert_rtn("+[CSPhoneCallStateMonitor sharedInstance]", "CSPhoneCallStateMonitor.m", 14, "NO");
}

- (unint64_t)phoneCallState
{
  __assert_rtn("-[CSPhoneCallStateMonitor phoneCallState]", "CSPhoneCallStateMonitor.m", 19, "NO");
}

- (BOOL)firstPartyCall
{
  __assert_rtn("-[CSPhoneCallStateMonitor firstPartyCall]", "CSPhoneCallStateMonitor.m", 24, "NO");
}

@end
