@implementation HMDCurrentAppleMediaAccessoryConfigurationLogEvent

- (HMDCurrentAppleMediaAccessoryConfigurationLogEvent)initWithNumPairedSensors:(id)a3 sensorStatus:(id)a4 numPairedSensorAutomations:(id)a5 numMediaAutomations:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDCurrentAppleMediaAccessoryConfigurationLogEvent *v14;
  uint64_t v15;
  NSNumber *numPairedSensors;
  uint64_t v17;
  NSNumber *sensorStatus;
  uint64_t v19;
  NSNumber *numPairedSensorAutomations;
  uint64_t v21;
  NSNumber *numMediaAutomations;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HMDCurrentAppleMediaAccessoryConfigurationLogEvent;
  v14 = -[HMMLogEvent init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    numPairedSensors = v14->_numPairedSensors;
    v14->_numPairedSensors = (NSNumber *)v15;

    v17 = objc_msgSend(v11, "copy");
    sensorStatus = v14->_sensorStatus;
    v14->_sensorStatus = (NSNumber *)v17;

    v19 = objc_msgSend(v12, "copy");
    numPairedSensorAutomations = v14->_numPairedSensorAutomations;
    v14->_numPairedSensorAutomations = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    numMediaAutomations = v14->_numMediaAutomations;
    v14->_numMediaAutomations = (NSNumber *)v21;

  }
  return v14;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.homekit.accessory.applemedia.configuration");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCurrentAppleMediaAccessoryConfigurationLogEvent numPairedSensors](self, "numPairedSensors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("numPairedHomePodSensors"));

  -[HMDCurrentAppleMediaAccessoryConfigurationLogEvent sensorStatus](self, "sensorStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("homePodSensorStatus"));

  -[HMDCurrentAppleMediaAccessoryConfigurationLogEvent numPairedSensorAutomations](self, "numPairedSensorAutomations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("numPairedHomePodSensorAutomations"));

  -[HMDCurrentAppleMediaAccessoryConfigurationLogEvent numMediaAutomations](self, "numMediaAutomations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("numMediaAutomations"));

  v8 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v8;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSNumber)numPairedSensors
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)sensorStatus
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)numPairedSensorAutomations
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)numMediaAutomations
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numMediaAutomations, 0);
  objc_storeStrong((id *)&self->_numPairedSensorAutomations, 0);
  objc_storeStrong((id *)&self->_sensorStatus, 0);
  objc_storeStrong((id *)&self->_numPairedSensors, 0);
}

@end
