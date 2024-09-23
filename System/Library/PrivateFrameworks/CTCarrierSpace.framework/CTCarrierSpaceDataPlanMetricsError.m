@implementation CTCarrierSpaceDataPlanMetricsError

+ (id)errorDescriptionForCode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12)
    return CFSTR("Unknown Error");
  else
    return off_24C24E4D8[a3];
}

@end
