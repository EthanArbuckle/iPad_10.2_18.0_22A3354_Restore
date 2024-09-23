@implementation BLSHWatchdogDidFireDetails

- (BLSHWatchdogDidFireDetails)initWithWatchdogDidFireDictionary:(id)a3
{
  id v4;
  BLSHWatchdogDidFireDetails *v5;
  NSDate *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDate *date;
  NSDate *v13;
  uint64_t v14;
  NSString *buildVersion;
  uint64_t v16;
  NSString *explanation;
  uint64_t v18;
  NSString *abortReasonString;
  uint64_t v20;
  NSString *device;
  NSObject *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BLSHWatchdogDidFireDetails;
  v5 = -[BLSHWatchdogDidFireDetails init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("BLSHWatchdogDidFireDate"), objc_opt_class());
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BLSHWatchdogDidFireBuildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHWatchdogDidFireExplanation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHWatchdogDidFireAbortReason"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHWatchdogDidFireDeviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hasSuffix:", CFSTR("AP")))
    {
      objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "length") - objc_msgSend(CFSTR("AP"), "length"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    date = v5->_date;
    v5->_date = v6;
    v13 = v6;

    v14 = objc_msgSend(v7, "copy");
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v14;

    v16 = objc_msgSend(v8, "copy");
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v16;

    v18 = objc_msgSend(v9, "copy");
    abortReasonString = v5->_abortReasonString;
    v5->_abortReasonString = (NSString *)v18;

    v20 = objc_msgSend(v10, "copy");
    device = v5->_device;
    v5->_device = (NSString *)v20;

    bls_backlight_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v5->_debugLogsEnabled = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);

  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)abortReasonString
{
  return self->_abortReasonString;
}

- (void)setAbortReasonString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)debugLogsEnabled
{
  return self->_debugLogsEnabled;
}

- (void)setDebugLogsEnabled:(BOOL)a3
{
  self->_debugLogsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abortReasonString, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
