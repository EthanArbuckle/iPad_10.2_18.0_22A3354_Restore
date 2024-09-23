@implementation CUIKTTLDescriptionGeneratorUtilities

+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesis:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(v4, "estimatedTravelTime");
  v6 = v5;
  v7 = objc_msgSend(v4, "supportsLiveTraffic");
  v8 = objc_msgSend(v4, "transportType");

  return objc_msgSend(a1, "ttlDescriptionShouldIncludeTrafficForHypothesisThatSupportsLiveTraffic:transportType:eta:", v7, v8, v6);
}

+ (BOOL)ttlDescriptionShouldIncludeTrafficForHypothesisThatSupportsLiveTraffic:(BOOL)a3 transportType:(int)a4 eta:(double)a5
{
  BOOL v5;

  if (a4)
    v5 = 0;
  else
    v5 = a3;
  return a5 > 300.0 && v5;
}

+ (unint64_t)ttlDescriptionTypeForDate:(id)a3 hypothesis:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CAA178], "date:representsLatenessForHypothesis:", v5, v6) & 1) != 0)
    v7 = 2;
  else
    v7 = objc_msgSend(MEMORY[0x1E0CAA178], "date:representsApproachingDepartureDateForHypothesis:", v5, v6) ^ 1;

  return v7;
}

+ (id)descriptionForType:(unint64_t)a3
{
  NSObject *v5;

  if (a3 < 3)
    return off_1E6EB6DC8[a3];
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[CUIKTTLDescriptionGeneratorUtilities descriptionForType:].cold.1(a3, v5);

  return &stru_1E6EBAE30;
}

+ (void)descriptionForType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "Could not get description for type - error: Unexpected TTL description type: [%@]", (uint8_t *)&v4, 0xCu);

}

@end
