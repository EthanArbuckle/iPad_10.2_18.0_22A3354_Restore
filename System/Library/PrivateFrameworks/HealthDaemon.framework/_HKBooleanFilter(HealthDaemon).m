@implementation _HKBooleanFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  if ((objc_msgSend(a1, "value") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D29890], "truePredicate");
  else
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
