@implementation IMDefaults

- (void)setValue:(id)a3 forDomain:(id)a4 forKey:(id)a5
{
  IMSetDomainValueForKey();
}

- (id)getValueFromDomain:(id)a3 forKey:(id)a4
{
  return (id)IMGetCachedDomainValueForKey();
}

- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4
{
  return IMGetDomainBoolForKey();
}

+ (id)sharedInstance
{
  if (qword_1ECFC74A8 != -1)
    dispatch_once(&qword_1ECFC74A8, &unk_1E3FB3248);
  return (id)qword_1ECFC7440;
}

- (BOOL)getBoolFromDomain:(id)a3 forKey:(id)a4 defaultValue:(BOOL)a5
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (void)setBool:(BOOL)a3 forDomain:(id)a4 forKey:(id)a5
{
  IMSetDomainValueForKey();
}

@end
