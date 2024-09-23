@implementation CSSmartSiriVolumeEstimate

- (CSSmartSiriVolumeEstimate)initWithVolumeEstimate:(float)a3 debugLogFile:(id)a4
{
  id v7;
  CSSmartSiriVolumeEstimate *v8;
  CSSmartSiriVolumeEstimate *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartSiriVolumeEstimate;
  v8 = -[CSSmartSiriVolumeEstimate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_volumeEstimate = a3;
    objc_storeStrong((id *)&v8->_debugLogPath, a4);
  }

  return v9;
}

- (CSSmartSiriVolumeEstimate)initWithCoder:(id)a3
{
  id v4;
  CSSmartSiriVolumeEstimate *v5;
  void *v6;
  float v7;
  uint64_t v8;
  NSString *debugLogPath;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSmartSiriVolumeEstimate;
  v5 = -[CSSmartSiriVolumeEstimate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("estimatedTTSVolume"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v5->_volumeEstimate = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugLogPath"));
    v8 = objc_claimAutoreleasedReturnValue();
    debugLogPath = v5->_debugLogPath;
    v5->_debugLogPath = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  float volumeEstimate;
  double v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  volumeEstimate = self->_volumeEstimate;
  v8 = a3;
  *(float *)&v6 = volumeEstimate;
  objc_msgSend(v4, "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("estimatedTTSVolume"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_debugLogPath, CFSTR("debugLogPath"));
}

- (float)volumeEstimate
{
  return self->_volumeEstimate;
}

- (NSString)debugLogPath
{
  return self->_debugLogPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugLogPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
