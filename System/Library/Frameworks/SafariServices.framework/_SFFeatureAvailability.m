@implementation _SFFeatureAvailability

+ (BOOL)isBrowserSelectionSheetEligible
{
  int domain_answer;
  NSObject *v3;
  _BOOL4 v4;

  domain_answer = os_eligibility_get_domain_answer();
  v3 = WBS_LOG_CHANNEL_PREFIXViewService();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
  if (domain_answer)
  {
    if (v4)
    {
      +[_SFFeatureAvailability isBrowserSelectionSheetEligible].cold.2(domain_answer, v3);
LABEL_6:
      LOBYTE(v4) = 0;
    }
  }
  else if (v4)
  {
    +[_SFFeatureAvailability isBrowserSelectionSheetEligible].cold.1(v3);
    goto LABEL_6;
  }
  return v4;
}

+ (BOOL)isTabBarAvailableForScreenSize:(CGSize)a3
{
  BOOL v3;

  v3 = fmin(a3.width, a3.height) > 375.0;
  return fmax(a3.width, a3.height) >= 812.0 || v3;
}

+ (BOOL)supportsCVV
{
  id v2;
  char v3;
  id v4;
  NSObject *v5;
  id v7;

  if (!MGGetBoolAnswer())
    return 0;
  v2 = objc_alloc_init(MEMORY[0x1E0CC12A0]);
  v7 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v7);
  v4 = v7;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXAutoFill();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[_SFFeatureAvailability supportsCVV].cold.1(v5, v4);
  }

  return v3;
}

+ (BOOL)isHSWADisabled
{
  int domain_answer;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  domain_answer = os_eligibility_get_domain_answer();
  v3 = WBS_LOG_CHANNEL_PREFIXWebApp();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (domain_answer)
  {
    if (v4)
    {
      *(_DWORD *)buf = 67109120;
      v10 = domain_answer;
      v5 = "Error when determining eligibility, error (%d)";
      v6 = v3;
      v7 = 8;
LABEL_6:
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, v5, buf, v7);
      LOBYTE(v4) = 0;
    }
  }
  else if (v4)
  {
    *(_WORD *)buf = 0;
    v5 = "Unable to determine eligibility";
    v6 = v3;
    v7 = 2;
    goto LABEL_6;
  }
  return v4;
}

+ (void)supportsCVV
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Encountered error when determining can evaluate policy: %{public}@", (uint8_t *)&v5, 0xCu);

}

+ (void)isBrowserSelectionSheetEligible
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1A3B2D000, a2, OS_LOG_TYPE_ERROR, "Error when determining eligibility, error (%d)", (uint8_t *)v2, 8u);
}

@end
