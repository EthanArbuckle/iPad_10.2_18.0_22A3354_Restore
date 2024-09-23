@implementation HMDSiriSyncEvent

- (HMDSiriSyncEvent)initWithDuration:(unint64_t)a3 serverConfigurationVersion:(unint64_t)a4 configurationVersion:(unint64_t)a5 lastSyncedConfigurationVersion:(unint64_t)a6 notificationReasons:(id)a7
{
  id v13;
  HMDSiriSyncEvent *v14;
  HMDSiriSyncEvent *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)HMDSiriSyncEvent;
  v14 = -[HMMLogEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_durationMilliseconds = a3;
    v14->_configurationVersion = a5;
    v14->_lastSyncedConfigurationVersion = a6;
    v14->_serverConfigurationVersion = a4;
    objc_storeStrong((id *)&v14->_notificationReasons, a7);
  }

  return v15;
}

- (double)duration
{
  return (double)self->_durationMilliseconds / 1000.0;
}

- (int64_t)durationMilliseconds
{
  return self->_durationMilliseconds;
}

- (NSArray)notificationReasons
{
  return self->_notificationReasons;
}

- (unint64_t)lastSyncedConfigurationVersion
{
  return self->_lastSyncedConfigurationVersion;
}

- (unint64_t)configurationVersion
{
  return self->_configurationVersion;
}

- (unint64_t)serverConfigurationVersion
{
  return self->_serverConfigurationVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationReasons, 0);
}

+ (id)syncRequestWithDuration:(unint64_t)a3 serverConfigurationVersion:(unint64_t)a4 configurationVersion:(unint64_t)a5 lastSyncedConfigurationVersion:(unint64_t)a6 notificationReasons:(id)a7
{
  id v11;
  HMDSiriSyncEvent *v12;

  v11 = a7;
  v12 = -[HMDSiriSyncEvent initWithDuration:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:notificationReasons:]([HMDSiriSyncEvent alloc], "initWithDuration:serverConfigurationVersion:configurationVersion:lastSyncedConfigurationVersion:notificationReasons:", a3, a4, a5, a6, v11);

  return v12;
}

@end
