@implementation UARPDeploymentRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPDeploymentRule)initWithConfig:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  UARPDeploymentRule *v14;
  void *v15;
  uint64_t v16;
  NSDate *goLiveDate;
  void *v18;
  uint64_t v19;
  NSArray *countryList;
  void *v21;
  uint64_t v22;
  NSNumber *rampPeriod;
  void *v24;
  uint64_t v25;
  NSNumber *deploymentLimit;
  os_log_t v27;
  OS_os_log *log;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *currentISOCountryCode;
  UARPDeploymentRule *v33;
  objc_super v35;

  v4 = a3;
  objc_msgSend(v4, "rampPeriod");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "deploymentLimit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_12;
  }
  objc_msgSend(v4, "rampPeriod");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "rampPeriod");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if (v10 != 7 && v10 != 28)
    {
LABEL_12:
      v33 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    objc_msgSend(v4, "deploymentLimit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "deploymentLimit");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedIntValue");

      if ((v13 - 1) > 0x62)
        goto LABEL_12;
    }
  }
  v35.receiver = self;
  v35.super_class = (Class)UARPDeploymentRule;
  v14 = -[UARPDeploymentRule init](&v35, sel_init);
  if (v14)
  {
    objc_msgSend(v4, "goLiveDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    goLiveDate = v14->_goLiveDate;
    v14->_goLiveDate = (NSDate *)v16;

    objc_msgSend(v4, "countryList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    countryList = v14->_countryList;
    v14->_countryList = (NSArray *)v19;

    objc_msgSend(v4, "rampPeriod");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    rampPeriod = v14->_rampPeriod;
    v14->_rampPeriod = (NSNumber *)v22;

    objc_msgSend(v4, "deploymentLimit");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    deploymentLimit = v14->_deploymentLimit;
    v14->_deploymentLimit = (NSNumber *)v25;

    v27 = os_log_create("com.apple.accessoryupdater.uarp", "deployment");
    log = v14->_log;
    v14->_log = (OS_os_log *)v27;

    objc_msgSend(MEMORY[0x24BE3CBC0], "sharedConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "countryCode");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    currentISOCountryCode = v14->_currentISOCountryCode;
    v14->_currentISOCountryCode = (NSString *)v31;

  }
  self = v14;
  v33 = self;
LABEL_13:

  return v33;
}

- (UARPDeploymentRule)initWithCoder:(id)a3
{
  id v4;
  UARPDeploymentRule *v5;
  uint64_t v6;
  NSDate *goLiveDate;
  uint64_t v8;
  NSNumber *rampPeriod;
  uint64_t v10;
  NSNumber *deploymentLimit;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *countryList;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UARPDeploymentRule;
  v5 = -[UARPDeploymentRule init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goLiveDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    goLiveDate = v5->_goLiveDate;
    v5->_goLiveDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rampPeriod"));
    v8 = objc_claimAutoreleasedReturnValue();
    rampPeriod = v5->_rampPeriod;
    v5->_rampPeriod = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deploymentLimit"));
    v10 = objc_claimAutoreleasedReturnValue();
    deploymentLimit = v5->_deploymentLimit;
    v5->_deploymentLimit = (NSNumber *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("countryList"));
    v15 = objc_claimAutoreleasedReturnValue();
    countryList = v5->_countryList;
    v5->_countryList = (NSArray *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *goLiveDate;
  id v5;

  goLiveDate = self->_goLiveDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", goLiveDate, CFSTR("goLiveDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_countryList, CFSTR("countryList"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rampPeriod, CFSTR("rampPeriod"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deploymentLimit, CFSTR("deploymentLimit"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  UARPDeploymentRule *v4;

  v4 = objc_alloc_init(UARPDeploymentRule);
  objc_storeStrong((id *)&v4->_goLiveDate, self->_goLiveDate);
  objc_storeStrong((id *)&v4->_countryList, self->_countryList);
  objc_storeStrong((id *)&v4->_rampPeriod, self->_rampPeriod);
  objc_storeStrong((id *)&v4->_deploymentLimit, self->_deploymentLimit);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: goLiveDate=%@, countryList=%@, rampPeriod=%@, deploymentLimit=%@>"), v5, self->_goLiveDate, self->_countryList, self->_rampPeriod, self->_deploymentLimit);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setTestSerialNumber:(id)a3
{
  NSString *v4;
  NSString *testSerialNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  testSerialNumber = self->_testSerialNumber;
  self->_testSerialNumber = v4;

}

- (id)testSerialNumber
{
  return self->_testSerialNumber;
}

- (void)setDeploymentDay:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentDay, a3);
}

- (id)deploymentDay
{
  return self->_deploymentDay;
}

- (void)setDeploymentPercent:(id)a3
{
  objc_storeStrong((id *)&self->_deploymentPercent, a3);
}

- (id)deploymentPercent
{
  return self->_deploymentPercent;
}

- (BOOL)isDeploymentAllowed:(id *)a3
{
  id v6;

  -[UARPDeploymentRule createSerialNumber](self, "createSerialNumber");
  -[UARPDeploymentRule calculateDeploymentDay](self, "calculateDeploymentDay");
  -[UARPDeploymentRule calculateDeploymentPercent](self, "calculateDeploymentPercent");
  if ((!self->_goLiveDate
     || -[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate](self, "isDeploymentAllowedPerGoLiveDate"))
    && (!-[NSArray count](self->_countryList, "count")
     || -[UARPDeploymentRule isDeploymentAllowedPerCountryList](self, "isDeploymentAllowedPerCountryList"))
    && (!self->_rampPeriod
     || -[UARPDeploymentRule isDeploymentAllowedPerRampPeriod](self, "isDeploymentAllowedPerRampPeriod"))
    && (!self->_deploymentLimit
     || -[UARPDeploymentRule isDeploymentAllowedPerDeploymentLimit](self, "isDeploymentAllowedPerDeploymentLimit")))
  {
    return 1;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessoryupdater.uarp"), 6, 0);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *a3 = v6;

  return 0;
}

- (BOOL)isDeploymentAllowedPerCountryList
{
  NSObject *log;
  NSString *currentISOCountryCode;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  int v10;
  const char *v11;
  __int16 v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!self->_currentISOCountryCode)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      currentISOCountryCode = self->_currentISOCountryCode;
      v10 = 136315394;
      v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
      v12 = 2112;
      v13 = currentISOCountryCode;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Current location unknown %@", (uint8_t *)&v10, 0x16u);
    }
    if (!self->_currentISOCountryCode)
      return 0;
  }
  v5 = -[NSArray containsObject:](self->_countryList, "containsObject:");
  v6 = self->_log;
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (!v5)
  {
    if (v7)
    {
      v10 = 136315138;
      v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
      _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "%s: Device not in country list, deployment not allowed", (uint8_t *)&v10, 0xCu);
    }
    return 0;
  }
  if (!v7)
    return 1;
  v10 = 136315138;
  v11 = "-[UARPDeploymentRule isDeploymentAllowedPerCountryList]";
  v8 = 1;
  _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "%s: Device is in country list", (uint8_t *)&v10, 0xCu);
  return v8;
}

- (BOOL)isDeploymentAllowedPerGoLiveDate
{
  void *v3;
  uint64_t v4;
  NSObject *log;
  BOOL v6;
  NSDate *goLiveDate;
  const char *v8;
  NSDate *v9;
  NSObject *v10;
  NSDate *v11;
  int v13;
  const char *v14;
  __int16 v15;
  NSDate *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "compare:", self->_goLiveDate);
  if (v4)
  {
    if (v4 == 1)
    {
      log = self->_log;
      v6 = 1;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        goLiveDate = self->_goLiveDate;
        v13 = 136315650;
        v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
        v15 = 2112;
        v16 = goLiveDate;
        v17 = 2112;
        v18 = v3;
        v8 = "%s: GoLive %@ date in past (today: %@), deployment allowed";
LABEL_7:
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      v10 = self->_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = self->_goLiveDate;
        v13 = 136315650;
        v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
        v15 = 2112;
        v16 = v11;
        v17 = 2112;
        v18 = v3;
        _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "%s: GoLive date (%@) in future (today: %@), deployment not allowed", (uint8_t *)&v13, 0x20u);
      }
      v6 = 0;
    }
  }
  else
  {
    log = self->_log;
    v6 = 1;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v9 = self->_goLiveDate;
      v13 = 136315650;
      v14 = "-[UARPDeploymentRule isDeploymentAllowedPerGoLiveDate]";
      v15 = 2112;
      v16 = v9;
      v17 = 2112;
      v18 = v3;
      v8 = "%s: GoLive %@ date today (today: %@), deployment allowed";
      goto LABEL_7;
    }
  }

  return v6;
}

- (BOOL)isDeploymentAllowedPerRampPeriod
{
  tm *v3;
  NSNumber *deploymentDay;
  unsigned int v5;
  int tm_wday;
  NSObject *log;
  _BOOL4 v8;
  BOOL v9;
  int v10;
  time_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  time(&v12);
  v3 = localtime(&v12);
  deploymentDay = self->_deploymentDay;
  if (!deploymentDay)
    return 0;
  v5 = -[NSNumber unsignedIntValue](deploymentDay, "unsignedIntValue");
  tm_wday = v3->tm_wday;
  log = self->_log;
  v8 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (tm_wday != v5)
  {
    if (v8)
    {
      v10 = v3->tm_wday;
      *(_DWORD *)buf = 136315650;
      v14 = "-[UARPDeploymentRule isDeploymentAllowedPerRampPeriod]";
      v15 = 1024;
      v16 = v10;
      v17 = 1024;
      v18 = v5;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Cannot apply update today is Day %d and this device can only do Ramped Updates on Day %d", buf, 0x18u);
    }
    return 0;
  }
  if (!v8)
    return 1;
  *(_DWORD *)buf = 136315394;
  v14 = "-[UARPDeploymentRule isDeploymentAllowedPerRampPeriod]";
  v15 = 1024;
  v16 = v5;
  v9 = 1;
  _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Today is the day for Ramped Updates: Day %d", buf, 0x12u);
  return v9;
}

- (BOOL)isDeploymentAllowedPerDeploymentLimit
{
  unsigned int v3;
  unsigned int v4;
  NSObject *log;
  _BOOL4 v6;
  BOOL v7;
  int v9;
  const char *v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->_deploymentPercent)
    return 0;
  v3 = -[NSNumber unsignedIntValue](self->_deploymentLimit, "unsignedIntValue");
  v4 = -[NSNumber unsignedIntValue](self->_deploymentPercent, "unsignedIntValue");
  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v4 > v3)
  {
    if (v6)
    {
      v9 = 136315650;
      v10 = "-[UARPDeploymentRule isDeploymentAllowedPerDeploymentLimit]";
      v11 = 1024;
      v12 = v3;
      v13 = 1024;
      v14 = v4;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Device cannot apply metered rollout as it doesn't fall under %d percent. Device is %d percent.", (uint8_t *)&v9, 0x18u);
    }
    return 0;
  }
  if (!v6)
    return 1;
  v9 = 136315394;
  v10 = "-[UARPDeploymentRule isDeploymentAllowedPerDeploymentLimit]";
  v11 = 1024;
  v12 = v4;
  v7 = 1;
  _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Device can apply metered rollout, %d percent.", (uint8_t *)&v9, 0x12u);
  return v7;
}

- (void)calculateDeploymentDay
{
  NSNumber *rampPeriod;
  unsigned int v4;
  const char *v5;
  NSUInteger v6;
  unint64_t i;
  uint64_t v8;
  unint64_t v9;
  NSObject *log;
  NSNumber *v11;
  NSNumber *deploymentDay;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_serialNumber)
  {
    rampPeriod = self->_rampPeriod;
    if (rampPeriod)
    {
      v4 = -[NSNumber unsignedIntValue](rampPeriod, "unsignedIntValue");
      v5 = -[NSString UTF8String](self->_serialNumber, "UTF8String");
      v6 = -[NSString length](self->_serialNumber, "length");
      for (i = 0; v6; --v6)
      {
        v8 = *v5++;
        i += v8;
      }
      v9 = i % v4;
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v13 = 136315394;
        v14 = "-[UARPDeploymentRule calculateDeploymentDay]";
        v15 = 1024;
        v16 = v9;
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: deployDay = %d", (uint8_t *)&v13, 0x12u);
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
      v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      deploymentDay = self->_deploymentDay;
      self->_deploymentDay = v11;

    }
  }
}

- (void)calculateDeploymentPercent
{
  NSString *serialNumber;
  const char *v4;
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  NSObject *log;
  NSNumber *v11;
  NSNumber *deploymentPercent;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    v4 = -[NSString UTF8String](serialNumber, "UTF8String");
    v5 = -[NSString length](self->_serialNumber, "length");
    if (v5)
    {
      v6 = 0;
      v7 = 3;
      do
      {
        v8 = *v4++;
        v6 += v8;
        v7 *= v8;
        --v5;
      }
      while (v5);
      v9 = v7 % 0xA + 10 * (v6 % 0xA);
    }
    else
    {
      v9 = 3;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[UARPDeploymentRule calculateDeploymentPercent]";
      v15 = 1024;
      v16 = v9;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: deployPercent = %d", (uint8_t *)&v13, 0x12u);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    deploymentPercent = self->_deploymentPercent;
    self->_deploymentPercent = v11;

  }
}

- (void)createSerialNumber
{
  NSString *testSerialNumber;
  NSString **p_serialNumber;
  NSObject *log;
  NSString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSString *v10;
  NSString *serialNumber;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  testSerialNumber = self->_testSerialNumber;
  if (testSerialNumber)
  {
    p_serialNumber = &self->_serialNumber;
    objc_storeStrong((id *)&self->_serialNumber, testSerialNumber);
    log = self->_log;
    if (!os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      return;
    v6 = *p_serialNumber;
    v13 = 136315394;
    v14 = "-[UARPDeploymentRule createSerialNumber]";
    v15 = 2112;
    v16 = v6;
    v7 = "%s: Using %@ provided by user as seed";
    v8 = log;
    v9 = 22;
  }
  else
  {
    v10 = (NSString *)MGCopyAnswer();
    serialNumber = self->_serialNumber;
    self->_serialNumber = v10;

    v12 = self->_log;
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      return;
    v13 = 136315138;
    v14 = "-[UARPDeploymentRule createSerialNumber]";
    v7 = "%s: Using device serial number as seed";
    v8 = v12;
    v9 = 12;
  }
  _os_log_impl(&dword_212D08000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v13, v9);
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "appendWithTabDepth:format:", a3, CFSTR("Deployment Rule:\n"));
  if (self->_currentISOCountryCode)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Current Country Code: %@\n"), self->_currentISOCountryCode);
  if (self->_goLiveDate)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Go-Live Date: %@\n"), self->_goLiveDate);
  if (-[NSArray count](self->_countryList, "count"))
  {
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Country List:"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_countryList;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v6, "appendFormat:", CFSTR(" %@"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    objc_msgSend(v6, "appendString:", CFSTR("\n"));
  }
  if (self->_rampPeriod)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Ramp Period: %@\n"), self->_rampPeriod);
  if (self->_deploymentLimit)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Deployment Limit: %@\n"), self->_deploymentLimit);
  if (self->_deploymentPercent)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Deployment Percent: %@\n"), self->_deploymentPercent);
  if (self->_deploymentDay)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Deployment Day: %@\n"), self->_deploymentDay);
  if (self->_serialNumber)
    objc_msgSend(v6, "appendWithTabDepth:format:", a3 + 1, CFSTR("Serial Number: %@\n"), self->_serialNumber);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deploymentDay, 0);
  objc_storeStrong((id *)&self->_deploymentPercent, 0);
  objc_storeStrong((id *)&self->_testSerialNumber, 0);
  objc_storeStrong((id *)&self->_deploymentLimit, 0);
  objc_storeStrong((id *)&self->_rampPeriod, 0);
  objc_storeStrong((id *)&self->_countryList, 0);
  objc_storeStrong((id *)&self->_goLiveDate, 0);
  objc_storeStrong((id *)&self->_currentISOCountryCode, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
