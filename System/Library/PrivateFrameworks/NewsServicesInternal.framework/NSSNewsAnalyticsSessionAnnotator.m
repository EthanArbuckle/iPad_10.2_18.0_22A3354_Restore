@implementation NSSNewsAnalyticsSessionAnnotator

- (NSSNewsAnalyticsSessionAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSSNewsAnalyticsSessionAnnotator;
  return -[NSSNewsAnalyticsSessionAnnotator init](&v3, sel_init);
}

- (void)annotateSession:(id)a3 withOptions:(unint64_t)a4
{
  __int16 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSNewsAnalyticsSessionAnnotator annotateSession:withOptions:].cold.1();
    if ((v4 & 1) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }
  NSSNTPBAnalyticsAppBuildNumberValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppBuildNumber:", v7);

  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0)
      goto LABEL_6;
    goto LABEL_22;
  }
LABEL_21:
  NSSNTPBAnalyticsAppVersionValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAppVersion:", v8);

  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_23;
  }
LABEL_22:
  objc_msgSend(v5, "setCellularRadioAccessTechnology:", NSSNTPBAnalyticsCellularRadioAccessTechnologyValue());
  if ((v4 & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_24;
  }
LABEL_23:
  NSSNTPBAnalyticsCountryCodeValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountryCode:", v9);

  if ((v4 & 0x20) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_25;
  }
LABEL_24:
  NFDevicePlatform();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceModel:", v10);

  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_26;
  }
LABEL_25:
  NSSNTPBAnalyticsDevicePlatformValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDevicePlatform:", v11);

  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_27;
  }
LABEL_26:
  NSSNTPBAnalyticsLanguageCodeValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLanguageCode:", v12);

  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_31;
  }
LABEL_27:
  if (NFInternalBuild())
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(v5, "setOsInstallVariant:", v13);
  if ((v4 & 0x200) == 0)
  {
LABEL_12:
    if ((v4 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_32;
  }
LABEL_31:
  NSSNTPBAnalyticsOsVersionValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOsVersion:", v14);

  if ((v4 & 0x400) == 0)
  {
LABEL_13:
    if ((v4 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v5, "setReachabilityStatus:", NSSNTPBAnalyticsReachabilityStatusValue());
  if ((v4 & 0x800) == 0)
  {
LABEL_14:
    if ((v4 & 0x1000) == 0)
      goto LABEL_15;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v5, "setUtcOffset:", NSSNTPBAnalyticsUtcOffsetValue());
  if ((v4 & 0x1000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0)
      goto LABEL_16;
LABEL_35:
    objc_msgSend(v5, "setSignedIntoIcloud:", NSSNTPBAnalyticsSignedIntoIcloudValue());
    if ((v4 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_34:
  objc_msgSend(v5, "setPrivateDataSyncOn:", NSSNTPBAnalyticsPrivateDataSyncOnValue());
  if ((v4 & 0x2000) != 0)
    goto LABEL_35;
LABEL_16:
  if ((v4 & 0x4000) != 0)
  {
LABEL_17:
    NSSNTPBAnalyticsUserStorefrontIdValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserStorefrontId:", v6);

  }
LABEL_18:

}

- (void)annotateSession:withOptions:.cold.1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"session", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
