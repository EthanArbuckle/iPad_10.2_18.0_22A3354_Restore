@implementation NSKeyedUnarchiver(LegacySupport)

+ (id)dnds_secureLegacyUnarchiverForReadingFromData:()LegacySupport error:
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3710];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, a4);

  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("BBBehaviorOverride"));
  objc_msgSend(v7, "setClass:forClassName:", objc_opt_class(), CFSTR("BBBehaviorOverrideEffectiveInterval"));
  return v7;
}

@end
