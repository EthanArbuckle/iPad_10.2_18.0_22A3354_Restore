@implementation NSSNewsAnalyticsTelemetryAnnotator

- (NSSNewsAnalyticsTelemetryAnnotator)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[NSSNewsAnalyticsTelemetryAnnotator init]";
    v9 = 2080;
    v10 = "NSSNewsAnalyticsUtilities.m";
    v11 = 1024;
    v12 = 244;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[NSSNewsAnalyticsTelemetryAnnotator init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSSNewsAnalyticsTelemetryAnnotator)initWithUserIDProvider:(id)a3
{
  id v5;
  NSSNewsAnalyticsTelemetryAnnotator *v6;
  NSSNewsAnalyticsTelemetryAnnotator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NSSNewsAnalyticsTelemetryAnnotator;
  v6 = -[NSSNewsAnalyticsTelemetryAnnotator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userIDProvider, a3);

  return v7;
}

- (void)annotateTelemetry:(id)a3 withOptions:(unint64_t)a4
{
  __int16 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[NSSNewsAnalyticsTelemetryAnnotator annotateTelemetry:withOptions:].cold.1();
    if ((v4 & 1) == 0)
    {
LABEL_4:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_18;
    }
  }
  else if ((v4 & 1) == 0)
  {
    goto LABEL_4;
  }
  NSSNTPBAnalyticsAppBuildNumberValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppBuildNumber:", v8);

  if ((v4 & 2) == 0)
  {
LABEL_5:
    if ((v4 & 8) == 0)
      goto LABEL_6;
    goto LABEL_19;
  }
LABEL_18:
  NSSNTPBAnalyticsAppVersionValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAppVersion:", v9);

  if ((v4 & 8) == 0)
  {
LABEL_6:
    if ((v4 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v6, "setContentEnvironment:", NSSNTPBAnalyticsContentEnvironmentValue());
  if ((v4 & 0x10) == 0)
  {
LABEL_7:
    if ((v4 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  NSSNTPBAnalyticsCountryCodeValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCountryCode:", v10);

  if ((v4 & 0x20) == 0)
  {
LABEL_8:
    if ((v4 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_22;
  }
LABEL_21:
  NFDevicePlatform();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDeviceModel:", v11);

  if ((v4 & 0x40) == 0)
  {
LABEL_9:
    if ((v4 & 0x80) == 0)
      goto LABEL_10;
    goto LABEL_23;
  }
LABEL_22:
  NSSNTPBAnalyticsDevicePlatformValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevicePlatform:", v12);

  if ((v4 & 0x80) == 0)
  {
LABEL_10:
    if ((v4 & 0x100) == 0)
      goto LABEL_11;
    goto LABEL_24;
  }
LABEL_23:
  NSSNTPBAnalyticsLanguageCodeValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguageCode:", v13);

  if ((v4 & 0x100) == 0)
  {
LABEL_11:
    if ((v4 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_28;
  }
LABEL_24:
  if (NFInternalBuild())
    v14 = 1;
  else
    v14 = 2;
  objc_msgSend(v6, "setOsInstallVariant:", v14);
  if ((v4 & 0x200) == 0)
  {
LABEL_12:
    if ((v4 & 0x400) == 0)
      goto LABEL_13;
LABEL_29:
    -[NSSNewsAnalyticsTelemetryAnnotator userIDProvider](self, "userIDProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserId:", v17);

    if ((v4 & 0x800) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_28:
  NSSNTPBAnalyticsOsVersionValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOsVersion:", v15);

  if ((v4 & 0x400) != 0)
    goto LABEL_29;
LABEL_13:
  if ((v4 & 0x800) != 0)
  {
LABEL_14:
    NSSNTPBAnalyticsUserStorefrontIdValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserStorefrontId:", v7);

  }
LABEL_15:

}

- (NSSNewsAnalyticsUserIDProvider)userIDProvider
{
  return self->_userIDProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDProvider, 0);
}

- (void)annotateTelemetry:withOptions:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D7116000, MEMORY[0x1E0C81028], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"telemetry", v6, 2u);

  OUTLINED_FUNCTION_2();
}

@end
