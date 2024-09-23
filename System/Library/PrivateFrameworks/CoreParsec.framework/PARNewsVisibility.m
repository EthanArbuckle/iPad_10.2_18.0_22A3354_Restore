@implementation PARNewsVisibility

+ (id)setOfActiveRestrictionUUIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.siri.parsec.news"));
}

@end
