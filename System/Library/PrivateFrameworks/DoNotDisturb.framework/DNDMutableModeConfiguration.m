@implementation DNDMutableModeConfiguration

- (void)setMode:(id)a3
{
  DNDMode *v4;
  DNDMode *mode;

  v4 = (DNDMode *)objc_msgSend(a3, "copy");
  mode = self->super._mode;
  self->super._mode = v4;

  -[DNDMutableModeConfiguration _configurationWasModified](self, "_configurationWasModified");
}

- (void)setConfiguration:(id)a3
{
  DNDConfiguration *v4;
  DNDConfiguration *configuration;
  BOOL v6;

  v4 = (DNDConfiguration *)objc_msgSend(a3, "copy");
  configuration = self->super._configuration;
  self->super._configuration = v4;

  -[DNDMutableModeConfiguration _configurationWasModified](self, "_configurationWasModified");
  v6 = (-[DNDConfiguration hasSecureData](self->super._configuration, "hasSecureData") & 1) != 0
    || -[DNDModeConfiguration _containsSecureTriggers:](self, "_containsSecureTriggers:", self->super._triggers);
  self->super._hasSecureData = v6;
}

- (void)setTriggers:(id)a3
{
  NSArray *v4;
  NSArray *triggers;
  BOOL v6;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  triggers = self->super._triggers;
  self->super._triggers = v4;

  -[DNDMutableModeConfiguration _configurationWasModified](self, "_configurationWasModified");
  v6 = (-[DNDConfiguration hasSecureData](self->super._configuration, "hasSecureData") & 1) != 0
    || -[DNDModeConfiguration _containsSecureTriggers:](self, "_containsSecureTriggers:", self->super._triggers);
  self->super._hasSecureData = v6;
}

- (void)setImpactsAvailability:(unint64_t)a3
{
  self->super._impactsAvailability = a3;
  -[DNDMutableModeConfiguration _configurationWasModified](self, "_configurationWasModified");
}

- (void)setDimsLockScreen:(unint64_t)a3
{
  self->super._dimsLockScreen = a3;
  -[DNDMutableModeConfiguration _configurationWasModified](self, "_configurationWasModified");
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDModeConfiguration _initWithModeConfiguration:](+[DNDModeConfiguration allocWithZone:](DNDModeConfiguration, "allocWithZone:", a3), "_initWithModeConfiguration:", self);
}

- (void)_configurationWasModified
{
  void *v3;
  void *v4;
  NSString *lastModifiedByDeviceID;
  __int128 v6;
  int64_t v7;

  self->super._automaticallyGenerated = 0;
  +[DNDDevice currentDevice](DNDDevice, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frameworkVersion");
  }
  else
  {
    v6 = 0uLL;
    v7 = 0;
  }
  *(_OWORD *)&self->super._lastModifiedByVersion.majorVersion = v6;
  self->super._lastModifiedByVersion.patchVersion = v7;

  lastModifiedByDeviceID = self->super._lastModifiedByDeviceID;
  self->super._lastModifiedByDeviceID = 0;

}

@end
