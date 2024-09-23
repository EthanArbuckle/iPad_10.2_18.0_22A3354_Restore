@implementation UARPAnalyticsUpdateFirmwareState

- (UARPAnalyticsUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  id v6;
  id v7;
  UARPAnalyticsUpdateFirmwareState *v8;
  uint64_t v9;
  UARPAccessoryID *accessoryID;
  uint64_t v11;
  UARPAssetID *assetID;
  uint64_t v13;
  NSDate *startDate;
  os_log_t v15;
  OS_os_log *log;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UARPAnalyticsUpdateFirmwareState;
  v8 = -[UARPAnalyticsUpdateFirmwareState init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    accessoryID = v8->_accessoryID;
    v8->_accessoryID = (UARPAccessoryID *)v9;

    v11 = objc_msgSend(v7, "copy");
    assetID = v8->_assetID;
    v8->_assetID = (UARPAssetID *)v11;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = objc_claimAutoreleasedReturnValue();
    startDate = v8->_startDate;
    v8->_startDate = (NSDate *)v13;

    v15 = os_log_create("com.apple.accessoryupdater.uarp", "analytics");
    log = v8->_log;
    v8->_log = (OS_os_log *)v15;

  }
  return v8;
}

- (void)stagingStartedWithUserIntent:(BOOL)a3
{
  NSObject *log;
  NSDate *v6;
  NSDate *stagingDurationStart;
  int v8;
  const char *v9;
  __int16 v10;
  UARPAnalyticsUpdateFirmwareState *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v8, 0x16u);
  }
  if ((self->_state | 2) == 2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    stagingDurationStart = self->_stagingDurationStart;
    self->_stagingDurationStart = v6;

    ++self->_stagingIterations;
    -[UARPAnalyticsUpdateFirmwareState setState:](self, "setState:", 1);
    self->_stagingUserInitiated = a3;
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingStartedWithUserIntent:].cold.1();
  }
}

- (void)stagingInterrupted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Staging interrupted while in an unexpected state: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stagingCompleteWithStatus:(unint64_t)a3
{
  NSObject *log;
  uint64_t v6;
  NSNumber *v7;
  NSNumber *stagingStatus;
  int v9;
  const char *v10;
  __int16 v11;
  UARPAnalyticsUpdateFirmwareState *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@", (uint8_t *)&v9, 0x16u);
  }
  if (self->_state == 1)
  {
    -[UARPAnalyticsUpdateFirmwareState setState:](self, "setState:", 3);
    -[UARPAnalyticsUpdateFirmwareState updateStagingDuration](self, "updateStagingDuration");
    if (a3 > 8)
      v6 = 8;
    else
      v6 = qword_212D8AF28[a3];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    stagingStatus = self->_stagingStatus;
    self->_stagingStatus = v7;

  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPAnalyticsUpdateFirmwareState stagingCompleteWithStatus:].cold.1();
  }
}

- (void)updateStagingDuration
{
  void *v3;
  double v4;
  double v5;
  NSDate *stagingDurationStart;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_stagingDurationStart);
  v5 = v4;

  stagingDurationStart = self->_stagingDurationStart;
  self->_stagingDurationSeconds += (unint64_t)v5;
  self->_stagingDurationStart = 0;

}

- (void)accessoryUnreachable
{
  if (self->_state == 1)
    -[UARPAnalyticsUpdateFirmwareState stagingInterrupted](self, "stagingInterrupted");
}

- (void)setState:(int64_t)a3
{
  unint64_t state;
  const char *v6;
  const char *v7;
  NSObject *log;
  int v9;
  UARPAnalyticsUpdateFirmwareState *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  state = self->_state;
  if (state > 3)
    v6 = "unrecognized";
  else
    v6 = off_24CEA2BE8[state];
  if ((unint64_t)a3 > 3)
    v7 = "unrecognized";
  else
    v7 = off_24CEA2BE8[a3];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2080;
    v12 = v6;
    v13 = 2080;
    v14 = v7;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%@ state change: %s -> %s", (uint8_t *)&v9, 0x20u);
  }
  self->_state = a3;
}

- (unint64_t)age
{
  void *v3;
  double v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_startDate);
  v5 = (unint64_t)v4;

  return v5;
}

- (UARPUpdateFirmwareAnalyticsEventFrameworkParams)eventParams
{
  UARPUpdateFirmwareAnalyticsEventFrameworkParams *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(UARPUpdateFirmwareAnalyticsEventFrameworkParams);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_stagingUserInitiated);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingUserInitiated:](v3, "setStagingUserInitiated:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_stagingDurationSeconds);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingDuration:](v3, "setStagingDuration:", v5);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_stagingIterations);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingIterations:](v3, "setStagingIterations:", v6);

  -[UARPUpdateFirmwareAnalyticsEventFrameworkParams setStagingStatus:](v3, "setStagingStatus:", self->_stagingStatus);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  UARPAnalyticsUpdateFirmwareState *v4;
  UARPAnalyticsUpdateFirmwareState *v5;
  UARPAccessoryID *accessoryID;
  void *v7;
  UARPAssetID *assetID;
  void *v9;
  char v10;

  v4 = (UARPAnalyticsUpdateFirmwareState *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      v5 = v4;
      accessoryID = self->_accessoryID;
      -[UARPAnalyticsUpdateFirmwareState accessoryID](v5, "accessoryID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UARPAccessoryID isEqual:](accessoryID, "isEqual:", v7))
      {
        assetID = self->_assetID;
        -[UARPAnalyticsUpdateFirmwareState assetID](v5, "assetID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[UARPAssetID isEqual:](assetID, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID manufacturer](self->_accessoryID, "manufacturer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID modelName](self->_accessoryID, "modelName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID serialNumber](self->_accessoryID, "serialNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAccessoryID firmwareVersion](self->_accessoryID, "firmwareVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID assetVersion](self->_assetID, "assetVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@ %@ [%@] %@ -> %@>"), v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UARPAccessoryID)accessoryID
{
  return (UARPAccessoryID *)objc_getProperty(self, a2, 104, 1);
}

- (UARPAssetID)assetID
{
  return (UARPAssetID *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_analyticsApplyStatus, 0);
  objc_storeStrong((id *)&self->_analyticsApplyUserInitiated, 0);
  objc_storeStrong((id *)&self->_analyticsApplyDurationStart, 0);
  objc_storeStrong((id *)&self->_stagingStatus, 0);
  objc_storeStrong((id *)&self->_stagingDurationStart, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)stagingStartedWithUserIntent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Staging started while in an unexpected state: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)stagingCompleteWithStatus:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_3(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Staging completed while in unexpected state: %s", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
