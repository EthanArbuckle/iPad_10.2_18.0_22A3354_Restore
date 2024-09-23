@implementation MXMUnitHitch

+ (MXMUnitHitch)hitches
{
  return -[MXMUnitHitch initWithSymbol:]([MXMUnitHitch alloc], "initWithSymbol:", CFSTR("hitches"));
}

+ (MXMUnitHitch)timeRatio
{
  return -[MXMUnitHitch initWithSymbol:]([MXMUnitHitch alloc], "initWithSymbol:", CFSTR("ms per s"));
}

@end
