@implementation CUIKTravelAdvisoryUtilities

+ (BOOL)doesHypothesisSatisfyMinimumAllowableTravelTime:(id)a3 minimumAllowableTravelTime:(double)a4
{
  double v5;

  objc_msgSend(a3, "estimatedTravelTime");
  return v5 >= a4;
}

@end
