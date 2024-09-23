@implementation BWSecureMetadataOutputConfigurator

+ (void)initialize
{
  objc_opt_class();
}

- (BWSecureMetadataOutputConfigurator)init
{
  BWSecureMetadataOutputConfigurator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfigurator;
  result = -[BWSecureMetadataOutputConfigurator init](&v3, sel_init);
  if (result)
    result->_stateLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWSecureMetadataOutputConfigurator;
  -[BWSecureMetadataOutputConfigurator dealloc](&v3, sel_dealloc);
}

- (BWSecureMetadataOutputConfiguration)configurationForPrimaryClient
{
  os_unfair_lock_s *p_stateLock;
  BWSecureMetadataOutputConfiguration *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = self->_configurationForPrimaryClient;
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (void)setConfigurationForPrimaryClient:(id)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);

  self->_configurationForPrimaryClient = (BWSecureMetadataOutputConfiguration *)a3;
  -[BWSecureMetadataOutputConfigurator _updateSecureMetadataOutputConfigurationForceDelegate:](self, "_updateSecureMetadataOutputConfigurationForceDelegate:", 0);
  os_unfair_lock_unlock(p_stateLock);
}

- (BWSecureMetadataOutputConfiguration)coalescedSecureMetadataOutputConfiguration
{
  os_unfair_lock_s *p_stateLock;
  BWSecureMetadataOutputConfiguration *v4;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (BWSecureMetadataOutputConfiguration *)(id)-[BWSecureMetadataOutputConfiguration copy](self->_coalescedSecureMetadataOutputConfiguration, "copy");
  os_unfair_lock_unlock(p_stateLock);
  return v4;
}

- (BWSecureMetadataOutputConfiguratorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_delegate != a3)
  {
    self->_delegate = (BWSecureMetadataOutputConfiguratorDelegate *)a3;
    if (a3)
      -[BWSecureMetadataOutputConfigurator _updateSecureMetadataOutputConfigurationForceDelegate:](self, "_updateSecureMetadataOutputConfigurationForceDelegate:", 1);
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (id)_coalescedClientConfiguration
{
  BWSecureMetadataOutputConfiguration *v3;

  v3 = (BWSecureMetadataOutputConfiguration *)-[BWSecureMetadataOutputConfiguration copy](self->_configurationForPrimaryClient, "copy");
  if (!v3)
    v3 = objc_alloc_init(BWSecureMetadataOutputConfiguration);
  -[BWSecureMetadataOutputConfiguration setEnabledDetectedObjectTypes:](v3, "setEnabledDetectedObjectTypes:", -[BWSecureMetadataOutputConfiguration enabledDetectedObjectTypes](self->_configurationForPrimaryClient, "enabledDetectedObjectTypes"));
  return v3;
}

- (void)_updateSecureMetadataOutputConfigurationForceDelegate:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  v5 = -[BWSecureMetadataOutputConfigurator _coalescedClientConfiguration](self, "_coalescedClientConfiguration");
  if ((objc_msgSend(v5, "isEqual:", self->_coalescedSecureMetadataOutputConfiguration) & 1) == 0)
  {

    self->_coalescedSecureMetadataOutputConfiguration = (BWSecureMetadataOutputConfiguration *)v5;
    goto LABEL_5;
  }
  if (v3)
LABEL_5:
    -[BWSecureMetadataOutputConfiguratorDelegate secureMetadataOutputConfigurationDidChange:](self->_delegate, "secureMetadataOutputConfigurationDidChange:", v5);
}

@end
