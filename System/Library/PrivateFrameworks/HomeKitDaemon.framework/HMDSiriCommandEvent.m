@implementation HMDSiriCommandEvent

- (HMDSiriCommandEvent)initWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11
{
  id v18;
  id v19;
  void *v20;
  HMDSiriCommandEvent *v21;
  uint64_t v22;
  NSString *clientMetricIdentifier;
  uint64_t v24;
  void *v25;
  HMDSiriCommandEvent *v26;
  HMDSiriCommandEvent *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v18 = a4;
  v19 = a5;
  v20 = v19;
  if (!v18)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      v31 = "%{public}@Can't init HMDSiriCommandEvent: actionType is nil";
LABEL_12:
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEFAULT, v31, buf, 0xCu);

    }
LABEL_13:

    objc_autoreleasePoolPop(v28);
    v27 = 0;
    goto LABEL_14;
  }
  if (!v19)
  {
    v28 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v36 = v30;
      v31 = "%{public}@Can't init HMDSiriCommandEvent: outcome is nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v34.receiver = self;
  v34.super_class = (Class)HMDSiriCommandEvent;
  v21 = -[HMMLogEvent init](&v34, sel_init);
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BE3F138], "currentActivity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "clientMetricIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    clientMetricIdentifier = v21->_clientMetricIdentifier;
    v21->_clientMetricIdentifier = (NSString *)v22;

    v21->_durationMilliseconds = a3;
    objc_storeStrong((id *)&v21->_actionType, a4);
    objc_storeStrong((id *)&v21->_outcome, a5);
    v21->_configurationVersion = a10;
    v21->_lastSyncedConfigurationVersion = a11;
    v21->_serverConfigurationVersion = a9;
    v21->_numberOfEntities = a6;
    v21->_numberOfFailures = a7;
    v21->_numberOfIncompletions = a8;
    v24 = objc_msgSend((id)objc_opt_class(), "generateErrorCodeWithNumberOfFailures:numberOfIncompletions:commandOutcome:", a7, a8, v20);
    if (v24)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HMDSiriCommandEventErrorDomain"), v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMLogEvent setError:](v21, "setError:", v25);

    }
  }
  v26 = v21;
  v27 = v26;
LABEL_14:

  return v27;
}

- (double)duration
{
  return (double)self->_durationMilliseconds / 1000.0;
}

- (int64_t)durationMilliseconds
{
  return self->_durationMilliseconds;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.siri.command");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HMDSiriCommandEvent actionType](self, "actionType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("actionType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDSiriCommandEvent durationMilliseconds](self, "durationMilliseconds"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("duration"));

  -[HMDSiriCommandEvent outcome](self, "outcome");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("outcome"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfEntities](self, "numberOfEntities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numTargetedEntities"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfFailures](self, "numberOfFailures"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("numFailures"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDSiriCommandEvent numberOfIncompletions](self, "numberOfIncompletions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("numIncompleteOperations"));

  if (-[HMDSiriCommandEvent numberOfEntities](self, "numberOfEntities"))
  {
    v10 = -[HMDSiriCommandEvent numberOfFailures](self, "numberOfFailures");
    v11 = (double)(-[HMDSiriCommandEvent numberOfIncompletions](self, "numberOfIncompletions") + v10) * 100.0;
    v12 = (unint64_t)(v11 / (double)-[HMDSiriCommandEvent numberOfEntities](self, "numberOfEntities") + 0.5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("failurePercentage"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 100 - v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("successPercentage"));

  }
  v15 = -[HMDSiriCommandEvent configurationVersion](self, "configurationVersion");
  v16 = -[HMDSiriCommandEvent lastSyncedConfigurationVersion](self, "lastSyncedConfigurationVersion");
  v17 = MEMORY[0x24BDBD1C0];
  v18 = MEMORY[0x24BDBD1C8];
  if (v15 == v16)
    v19 = MEMORY[0x24BDBD1C8];
  else
    v19 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("currentConfigMatchesLastSynced"));
  v20 = -[HMDSiriCommandEvent configurationVersion](self, "configurationVersion");
  if (v20 == -[HMDSiriCommandEvent serverConfigurationVersion](self, "serverConfigurationVersion"))
    v21 = v18;
  else
    v21 = v17;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("currentConfigMatchesServer"));
  v22 = -[HMDSiriCommandEvent lastSyncedConfigurationVersion](self, "lastSyncedConfigurationVersion");
  if (v22 == -[HMDSiriCommandEvent serverConfigurationVersion](self, "serverConfigurationVersion"))
    v23 = v18;
  else
    v23 = v17;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("lastSyncedConfigMatchesServer"));
  v24 = -[HMDSiriCommandEvent configurationVersion](self, "configurationVersion");
  if (v24 == -[HMDSiriCommandEvent lastSyncedConfigurationVersion](self, "lastSyncedConfigurationVersion"))
  {
    v25 = -[HMDSiriCommandEvent lastSyncedConfigurationVersion](self, "lastSyncedConfigurationVersion");
    if (v25 == -[HMDSiriCommandEvent serverConfigurationVersion](self, "serverConfigurationVersion"))
      v17 = v18;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("allConfigsMatch"));
  if (isInternalBuild())
  {
    -[HMDSiriCommandEvent clientMetricIdentifier](self, "clientMetricIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("clientMetricIdentifier"));

  }
  v27 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v27;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)outcome
{
  return self->_outcome;
}

- (unint64_t)numberOfEntities
{
  return self->_numberOfEntities;
}

- (unint64_t)numberOfFailures
{
  return self->_numberOfFailures;
}

- (unint64_t)numberOfIncompletions
{
  return self->_numberOfIncompletions;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (unint64_t)lastSyncedConfigurationVersion
{
  return self->_lastSyncedConfigurationVersion;
}

- (unint64_t)serverConfigurationVersion
{
  return self->_serverConfigurationVersion;
}

- (NSString)clientMetricIdentifier
{
  return self->_clientMetricIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientMetricIdentifier, 0);
  objc_storeStrong((id *)&self->_outcome, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

+ (unint64_t)generateErrorCodeWithNumberOfFailures:(unint64_t)a3 numberOfIncompletions:(unint64_t)a4 commandOutcome:(id)a5
{
  id v7;
  void *v8;
  unint64_t v9;

  v7 = a5;
  v8 = v7;
  if (a4 || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE81EE0]) & 1) != 0)
  {
    v9 = 2;
  }
  else if (a3)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE81EB0]) ^ 1;
  }

  return v9;
}

+ (id)commandEventWithDuration:(unint64_t)a3 actionType:(id)a4 outcome:(id)a5 numberOfEntities:(unint64_t)a6 numberOfFailures:(unint64_t)a7 numberOfIncompletions:(unint64_t)a8 serverConfigurationVersion:(unint64_t)a9 configurationVersion:(unint64_t)a10 lastSyncedConfigurationVersion:(unint64_t)a11
{
  id v16;
  id v17;
  HMDSiriCommandEvent *v18;

  v16 = a5;
  v17 = a4;
  v18 = -[HMDSiriCommandEvent initWithDuration:actionType:outcome:numberOfEntities:numberOfFailures:numberOfIncompletions:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:]([HMDSiriCommandEvent alloc], "initWithDuration:actionType:outcome:numberOfEntities:numberOfFailures:numberOfIncompletions:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:", a3, v17, v16, a6, a7, a8, a9, a10, a11);

  return v18;
}

@end
