@implementation ASCEligibility

+ (void)abortExecution
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Current process is not eligible to use ASC", v0, 2u);
}

+ (void)assertCurrentProcessEligibility
{
  objc_opt_self();
  if ((+[ASCEligibility currentClientIsEligibleToUseASC]() & 1) == 0)
    +[ASCEligibility abortExecution]();
}

+ (uint64_t)currentClientIsEligibleToUseASC
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v0 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((+[ASCEligibility clientWithBundleIDIsEligibleToUseASC:](v0, v2) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = +[ASCEligibility clientWithProcessNameIsEligibleToUseASC:](v0, v5);

  }
  return v3;
}

+ (uint64_t)clientWithBundleIDIsEligibleToUseASC:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple."));

  return v3;
}

+ (uint64_t)clientWithProcessNameIsEligibleToUseASC:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Clip"));

  return v3;
}

+ (BOOL)isSpotlightClient:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  int v7;

  if ((objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.Spotlight")) & 1) != 0)
    return 1;
  v5 = 0;
  do
  {
    v6 = v5;
    if (v5 == 9)
      break;
    v7 = objc_msgSend(a3, "hasPrefix:", SpotlightClientBundleIDPrefixes[v5 + 1]);
    v5 = v6 + 1;
  }
  while (!v7);
  return v6 < 9;
}

+ (BOOL)isInternalASCClient:(id)a3
{
  uint64_t v4;
  char v5;
  int v6;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = objc_msgSend(a3, "hasPrefix:", InternalASCClientBundleIDPrefixes[v4]);
    if ((v5 & 1) == 0)
      break;
    v5 = 0;
    v4 = 1;
  }
  while (!v6);
  return v6;
}

+ (BOOL)isITunesStoreClient:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.MobileStore"));
}

+ (BOOL)isGameOverlayUI:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("com.apple.GameOverlayUI"));
}

+ (uint64_t)currentClientIsEligibleToUseLockupViewSize:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  v3 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[ASCEligibility clientWithBundleID:isEligibleToUseLockupViewSize:](v3, v5, v2);

  return v6;
}

+ (uint64_t)clientWithBundleID:(void *)a3 isEligibleToUseLockupViewSize:
{
  id v4;
  id v5;
  void *v6;
  const char *v7;
  int IsSmallOfferButton;
  void *v9;
  char v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  IsSmallOfferButton = ASCLockupViewSizeIsSmallOfferButton(v5, v7);

  if (!IsSmallOfferButton
    || (objc_msgSend(v4, "asc_sha246Hash"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("BKN3YPrkowJshOfzYN9kxtu/zEFYrAWOeXV3rzu9h1k=")),
        v9,
        (v10 & 1) != 0)
    || (objc_msgSend(v6, "isInternalASCClient:", v4) & 1) != 0
    || (objc_msgSend(v6, "isSpotlightClient:", v4) & 1) != 0
    || (objc_msgSend(v6, "isITunesStoreClient:", v4) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v6, "isGameOverlayUI:", v4);
  }

  return v11;
}

@end
