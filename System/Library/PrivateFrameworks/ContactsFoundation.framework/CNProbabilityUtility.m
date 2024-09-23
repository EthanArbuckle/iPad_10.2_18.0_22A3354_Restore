@implementation CNProbabilityUtility

- (BOOL)trueWithProbability:(double)a3
{
  if (a3 < 0.0 || a3 > 1.0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Probability must be in range [0,1]"));
  return (float)((float)arc4random_uniform(0x2710u) / 10000.0) <= a3;
}

@end
