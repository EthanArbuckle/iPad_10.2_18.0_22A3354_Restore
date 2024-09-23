@implementation HDDimensionlessUnit

+ (HDDimensionlessUnit)errors
{
  return -[HDDimensionlessUnit initWithSymbol:]([HDDimensionlessUnit alloc], "initWithSymbol:", CFSTR("error(s)"));
}

+ (HDDimensionlessUnit)counts
{
  return -[HDDimensionlessUnit initWithSymbol:]([HDDimensionlessUnit alloc], "initWithSymbol:", CFSTR("count(s)"));
}

+ (HDDimensionlessUnit)events
{
  return -[HDDimensionlessUnit initWithSymbol:]([HDDimensionlessUnit alloc], "initWithSymbol:", CFSTR("event(s)"));
}

+ (HDDimensionlessUnit)frames
{
  return -[HDDimensionlessUnit initWithSymbol:]([HDDimensionlessUnit alloc], "initWithSymbol:", CFSTR("frame(s)"));
}

@end
