@implementation CALNTravelAdvisoryUtilities

+ (BOOL)isLastFireTimeOfAlert:(id)a3 withinEightMinutesOfDate:(id)a4
{
  double v4;

  objc_msgSend(a3, "timeIntervalSinceDate:", a4);
  if (v4 < 0.0)
    v4 = -v4;
  return v4 <= 480.0;
}

@end
