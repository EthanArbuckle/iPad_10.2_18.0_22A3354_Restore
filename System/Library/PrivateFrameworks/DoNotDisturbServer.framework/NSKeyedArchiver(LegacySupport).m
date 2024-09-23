@implementation NSKeyedArchiver(LegacySupport)

+ (id)dnds_secureLegacyArchiver
{
  void *v0;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v0, "setClassName:forClass:", CFSTR("BBBehaviorOverride"), objc_opt_class());
  objc_msgSend(v0, "setClassName:forClass:", CFSTR("BBBehaviorOverrideEffectiveInterval"), objc_opt_class());
  return v0;
}

@end
