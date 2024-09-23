@implementation HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent

- (HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent)initWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8
{
  HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent;
  result = -[HMMLogEvent init](&v15, sel_init);
  if (result)
  {
    result->_autoThirdPartySoftwareUpdateEnable = a3;
    result->_numHAPAccessories = a4;
    result->_numCameraAccessories = a5;
    result->_numCameraAccessoriesRecordingEnabled = a6;
    result->_numSecurityClassAccessories = a7;
    result->_numCriticalSensorAccessories = a8;
  }
  return result;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.accessory.softwareupdate.auto.thirdparty.toggled");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("autoThirdPartySoftwareUpdateEnable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent autoThirdPartySoftwareUpdateEnable](self, "autoThirdPartySoftwareUpdateEnable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("numHAPAccessories");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numHAPAccessories](self, "numHAPAccessories"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("numCameraAccessories");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCameraAccessories](self, "numCameraAccessories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("numCameraAccessoriesRecordingEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCameraAccessoriesRecordingEnabled](self, "numCameraAccessoriesRecordingEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("numSecurityClassAccessories");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numSecurityClassAccessories](self, "numSecurityClassAccessories"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  v11[5] = CFSTR("numCriticalSensorAccessories");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent numCriticalSensorAccessories](self, "numCriticalSensorAccessories"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (BOOL)autoThirdPartySoftwareUpdateEnable
{
  return self->_autoThirdPartySoftwareUpdateEnable;
}

- (unint64_t)numHAPAccessories
{
  return self->_numHAPAccessories;
}

- (unint64_t)numCameraAccessories
{
  return self->_numCameraAccessories;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  return self->_numCameraAccessoriesRecordingEnabled;
}

- (unint64_t)numSecurityClassAccessories
{
  return self->_numSecurityClassAccessories;
}

- (unint64_t)numCriticalSensorAccessories
{
  return self->_numCriticalSensorAccessories;
}

+ (id)eventWithAutoThirdPartyUpdateEnable:(BOOL)a3 numHAPAccessories:(unint64_t)a4 numCameraAccessories:(unint64_t)a5 numCameraAccessoriesRecordingEnabled:(unint64_t)a6 numSecurityClassAccessories:(unint64_t)a7 numCriticalSensorAccessories:(unint64_t)a8
{
  return -[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent initWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:]([HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent alloc], "initWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:", a3, a4, a5, a6, a7, a8);
}

+ (id)eventWithHome:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "accessoryCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

  +[HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent eventWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:](HMDAccessorySoftwareUpdateAutoThirdPartyToggledEvent, "eventWithAutoThirdPartyUpdateEnable:numHAPAccessories:numCameraAccessories:numCameraAccessoriesRecordingEnabled:numSecurityClassAccessories:numCriticalSensorAccessories:", v5, objc_msgSend(v4, "numHAPAccessories"), objc_msgSend(v4, "numCameraAccessories"), objc_msgSend(v4, "numCameraAccessoriesRecordingEnabled"), objc_msgSend(v4, "numSecurityClassAccessories"), objc_msgSend(v4, "numCriticalSensorAccessories"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
