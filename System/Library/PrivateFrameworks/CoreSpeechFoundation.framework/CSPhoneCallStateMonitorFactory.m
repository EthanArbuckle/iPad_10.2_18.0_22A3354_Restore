@implementation CSPhoneCallStateMonitorFactory

+ (id)phoneCallStateMonitor
{
  _BOOL4 v2;
  __objc2_class **v3;

  v2 = +[CSUtils supportRelayCall](CSUtils, "supportRelayCall");
  v3 = off_1E687CB78;
  if (!v2)
    v3 = off_1E687C8C8;
  -[__objc2_class sharedInstance](*v3, "sharedInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
