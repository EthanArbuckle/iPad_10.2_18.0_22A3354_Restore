@implementation SecExperimentConfig

- (SecExperimentConfig)initWithConfiguration:(id)a3
{
  id v4;
  SecExperimentConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SecExperimentConfig *v12;
  objc_super v14;

  v4 = a3;
  if (v4
    && (v14.receiver = self,
        v14.super_class = (Class)SecExperimentConfig,
        v5 = -[SecExperimentConfig init](&v14, sel_init),
        (self = v5) != 0))
  {
    -[SecExperimentConfig setConfig:](v5, "setConfig:", v4);
    objc_msgSend(v4, "objectForKey:", CFSTR("ExpName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecExperimentConfig setIdentifier:](self, "setIdentifier:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("DeviceSampleRate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      -[SecExperimentConfig setDeviceSampleRate:](self, "setDeviceSampleRate:", objc_msgSend(v7, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKey:", CFSTR("FleetSampleRate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      -[SecExperimentConfig setFleetSampleRate:](self, "setFleetSampleRate:", objc_msgSend(v9, "unsignedIntValue"));
    objc_msgSend(v4, "objectForKey:", CFSTR("ConfigData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SecExperimentConfig setConfigurationData:](self, "setConfigurationData:", v11);

    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unsigned)hostHash
{
  if (sec_experiment_host_hash_onceToken != -1)
    dispatch_once(&sec_experiment_host_hash_onceToken, &__block_literal_global_394);
  return sec_experiment_host_hash_hash;
}

- (BOOL)shouldRunWithSamplingRate:(id)a3
{
  id v3;
  float v4;
  unint64_t v5;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = (float)arc4random();
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return (float)(4295000000.0 / (float)v5) > v4;
}

- (BOOL)isSampled
{
  unsigned int v3;
  void *v5;
  BOOL v6;

  v3 = -[SecExperimentConfig hostHash](self, "hostHash");
  if (!v3 || -[SecExperimentConfig fleetSampleRate](self, "fleetSampleRate") < v3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SecExperimentConfig deviceSampleRate](self, "deviceSampleRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SecExperimentConfig shouldRunWithSamplingRate:](self, "shouldRunWithSamplingRate:", v5);

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unsigned)fleetSampleRate
{
  return self->_fleetSampleRate;
}

- (void)setFleetSampleRate:(unsigned int)a3
{
  self->_fleetSampleRate = a3;
}

- (unsigned)deviceSampleRate
{
  return self->_deviceSampleRate;
}

- (void)setDeviceSampleRate:(unsigned int)a3
{
  self->_deviceSampleRate = a3;
}

- (NSDictionary)configurationData
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigurationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)config
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfig:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_configurationData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
