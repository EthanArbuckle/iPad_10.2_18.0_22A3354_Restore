@implementation DNDSMutableModeConfigurationRecord

- (void)setMode:(id)a3
{
  DNDSModeRecord *v4;
  DNDSModeRecord *mode;

  v4 = (DNDSModeRecord *)objc_msgSend(a3, "copy");
  mode = self->super._mode;
  self->super._mode = v4;

}

- (void)setConfiguration:(id)a3
{
  DNDSConfigurationRecord *v4;
  DNDSConfigurationRecord *configuration;

  v4 = (DNDSConfigurationRecord *)objc_msgSend(a3, "copy");
  configuration = self->super._configuration;
  self->super._configuration = v4;

}

- (void)setSecureConfiguration:(id)a3
{
  DNDSConfigurationSecureRecord *v4;
  DNDSConfigurationSecureRecord *secureConfiguration;

  v4 = (DNDSConfigurationSecureRecord *)objc_msgSend(a3, "copy");
  secureConfiguration = self->super._secureConfiguration;
  self->super._secureConfiguration = v4;

}

- (void)setTriggers:(id)a3
{
  DNDSModeConfigurationTriggersRecord *v4;
  DNDSModeConfigurationTriggersRecord *triggers;

  v4 = (DNDSModeConfigurationTriggersRecord *)objc_msgSend(a3, "copy");
  triggers = self->super._triggers;
  self->super._triggers = v4;

}

- (void)setImpactsAvailability:(unint64_t)a3
{
  self->super._impactsAvailability = a3;
}

- (void)setDimsLockScreen:(unint64_t)a3
{
  self->super._dimsLockScreen = a3;
}

- (void)setCreated:(id)a3
{
  NSDate *v4;
  NSDate *created;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  created = self->super._created;
  self->super._created = v4;

}

- (void)setLastModified:(id)a3
{
  NSDate *v4;
  NSDate *lastModified;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  lastModified = self->super._lastModified;
  self->super._lastModified = v4;

}

- (void)setLastModifiedByVersion:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->super._lastModifiedByVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion = v3;
}

- (void)setLastModifiedByDeviceID:(id)a3
{
  NSString *v4;
  NSString *lastModifiedByDeviceID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  self->super._lastModifiedByDeviceID = v4;

}

- (void)setAutomaticallyGenerated:(BOOL)a3
{
  self->super._automaticallyGenerated = a3;
}

- (void)setCompatibilityVersion:(int64_t)a3
{
  self->super._compatibilityVersion = a3;
}

- (void)setEphemeralResolvedCompatibilityVersion:(int64_t)a3
{
  self->super._ephemeralResolvedCompatibilityVersion = a3;
}

- (void)setHasSecureData:(BOOL)a3
{
  self->super._hasSecureData = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  DNDSModeRecord *mode;
  DNDSConfigurationRecord *configuration;
  DNDSConfigurationSecureRecord *secureConfiguration;
  DNDSModeConfigurationTriggersRecord *triggers;
  unint64_t impactsAvailability;
  unint64_t dimsLockScreen;
  NSDate *created;
  NSDate *lastModified;
  BOOL automaticallyGenerated;
  int64_t compatibilityVersion;
  int64_t ephemeralResolvedCompatibilityVersion;
  BOOL hasSecureData;
  NSString *lastModifiedByDeviceID;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  int64_t patchVersion;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  mode = self->super._mode;
  configuration = self->super._configuration;
  secureConfiguration = self->super._secureConfiguration;
  triggers = self->super._triggers;
  impactsAvailability = self->super._impactsAvailability;
  dimsLockScreen = self->super._dimsLockScreen;
  created = self->super._created;
  lastModified = self->super._lastModified;
  automaticallyGenerated = self->super._automaticallyGenerated;
  compatibilityVersion = self->super._compatibilityVersion;
  ephemeralResolvedCompatibilityVersion = self->super._ephemeralResolvedCompatibilityVersion;
  hasSecureData = self->super._hasSecureData;
  v21 = *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion;
  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  patchVersion = self->super._lastModifiedByVersion.patchVersion;
  LOBYTE(v20) = hasSecureData;
  LOBYTE(v19) = automaticallyGenerated;
  return (id)objc_msgSend(v4, "_initWithMode:configuration:secureConfiguration:triggers:impactsAvailability:dimsLockScreen:created:lastModified:lastModifiedByVersion:lastModifiedByDeviceID:automaticallyGenerated:compatibilityVersion:ephemeralResolvedCompatibilityVersion:hasSecureData:", mode, configuration, secureConfiguration, triggers, impactsAvailability, dimsLockScreen, created, lastModified, &v21, lastModifiedByDeviceID, v19, compatibilityVersion, ephemeralResolvedCompatibilityVersion, v20);
}

@end
