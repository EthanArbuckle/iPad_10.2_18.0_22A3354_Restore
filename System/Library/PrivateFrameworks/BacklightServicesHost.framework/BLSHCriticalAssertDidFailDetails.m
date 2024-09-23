@implementation BLSHCriticalAssertDidFailDetails

- (BLSHCriticalAssertDidFailDetails)initWithCriticalAssertDidFailDictionary:(id)a3
{
  id v4;
  BLSHCriticalAssertDidFailDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSDate *date;
  uint64_t v15;
  NSString *buildVersion;
  uint64_t v17;
  NSString *explanation;
  uint64_t v19;
  NSString *processName;
  NSString *device;
  NSObject *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BLSHCriticalAssertDidFailDetails;
  v5 = -[BLSHCriticalAssertDidFailDetails init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "bs_safeObjectForKey:ofType:", CFSTR("BLSHCriticalAssertDidFailDate"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHCriticalAssertDidFailBuildVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHCriticalAssertDidFailDescription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_safeStringForKey:", CFSTR("BLSHCriticalAssertDidFailProcess"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MGCopyAnswer();
    v11 = (void *)objc_msgSend(v10, "copy");

    if (objc_msgSend(v11, "hasSuffix:", CFSTR("AP")))
    {
      objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - objc_msgSend(CFSTR("AP"), "length"));
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    v13 = objc_msgSend(v6, "copy");
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v15 = objc_msgSend(v7, "copy");
    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v15;

    v17 = objc_msgSend(v8, "copy");
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v17;

    v19 = objc_msgSend(v9, "copy");
    processName = v5->_processName;
    v5->_processName = (NSString *)v19;

    device = v5->_device;
    v5->_device = (NSString *)v11;

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

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
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
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
