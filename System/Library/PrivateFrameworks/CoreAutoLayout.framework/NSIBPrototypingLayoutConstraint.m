@implementation NSIBPrototypingLayoutConstraint

+ (id)classFallbacksForKeyedArchiver
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("NSLayoutConstraint"));
}

- (BOOL)_isIBPrototypingLayoutConstraint
{
  return 1;
}

@end
