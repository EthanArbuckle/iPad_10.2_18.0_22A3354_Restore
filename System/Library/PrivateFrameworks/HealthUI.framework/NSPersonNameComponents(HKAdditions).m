@implementation NSPersonNameComponents(HKAdditions)

- (BOOL)isGivenNameFirst
{
  return objc_msgSend(MEMORY[0x1E0CB3858], "_nameOrderWithOverridesForComponents:options:", a1, 0) != 2;
}

@end
