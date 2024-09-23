@implementation CUIKTravelAdvisoryDescriptionUtilities

+ (BOOL)shouldIncludeTravelAdvisoryDescription:(id)a3
{
  id v3;
  NSObject *v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  double v30;
  double v31;

  v3 = a3;
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.5((uint64_t)v3, v4);

  objc_msgSend(MEMORY[0x1E0CAA178], "minimumAllowableTravelTime");
  v6 = v5;
  if (objc_msgSend(v3, "travelState") == 5)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
LABEL_15:
    v29 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(MEMORY[0x1E0CAA178], "travelStateIndicatesTravelingTowardDestination:", objc_msgSend(v3, "travelState")))
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.2(v7, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_15;
  }
  if (!+[CUIKTravelAdvisoryUtilities doesHypothesisSatisfyMinimumAllowableTravelTime:minimumAllowableTravelTime:](CUIKTravelAdvisoryUtilities, "doesHypothesisSatisfyMinimumAllowableTravelTime:minimumAllowableTravelTime:", v3, v6))
  {
    objc_msgSend(v3, "estimatedTravelTime");
    v31 = v30;
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.4(v7, v31, v6);
    goto LABEL_15;
  }
  +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[CUIKTravelAdvisoryDescriptionUtilities shouldIncludeTravelAdvisoryDescription:].cold.3(v7, v22, v23, v24, v25, v26, v27, v28);
  v29 = 1;
LABEL_16:

  return v29;
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, a1, a3, "Should not include travel advisory description since hypothesis travel state is arrived.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, a1, a3, "Should not include travel advisory description since hypothesis travel state indicates traveling toward destination.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, a1, a3, "Determined that the travel advisory should be included for hypothesis.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

+ (void)shouldIncludeTravelAdvisoryDescription:(double)a3 .cold.4(NSObject *a1, double a2, double a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1B8A6A000, a1, OS_LOG_TYPE_DEBUG, "Hypothesis travel time: [%@] does not satisfy minimum allowable travel time: [%@].", (uint8_t *)&v7, 0x16u);

}

+ (void)shouldIncludeTravelAdvisoryDescription:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_DEBUG, "Determining whether or not travel advisory description should be included for hypothesis: [%@].", (uint8_t *)&v2, 0xCu);
}

@end
