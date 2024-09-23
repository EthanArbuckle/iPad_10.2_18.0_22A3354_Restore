@implementation MXMClockSampleTag

+ (id)root
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDNString:", CFSTR("clock.time"));
}

+ (MXMClockSampleTag)absoluteTime
{
  return (MXMClockSampleTag *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDNString:", CFSTR("clock.time.absolute"));
}

+ (MXMClockSampleTag)continuousTime
{
  return (MXMClockSampleTag *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDNString:", CFSTR("clock.time.continuous"));
}

@end
