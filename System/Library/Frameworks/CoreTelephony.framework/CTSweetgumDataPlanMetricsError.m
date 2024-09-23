@implementation CTSweetgumDataPlanMetricsError

+ (id)errorDescriptionForCode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12)
    return CFSTR("Unknown Error");
  else
    return (id)*((_QWORD *)&off_1E152DC58 + a3);
}

@end
