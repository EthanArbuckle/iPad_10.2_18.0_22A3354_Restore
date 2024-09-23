@implementation DMFFetchConfigurationSourceSyncTokenRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationSourceSyncTokenRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchConfigurationSourceSyncTokenRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *configurationSource;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchConfigurationSourceSyncTokenRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("configurationSource"));
    v7 = objc_claimAutoreleasedReturnValue();
    configurationSource = v5->_configurationSource;
    v5->_configurationSource = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationSourceSyncTokenRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchConfigurationSourceSyncTokenRequest configurationSource](self, "configurationSource", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("configurationSource"));

}

- (NSString)configurationSource
{
  return self->_configurationSource;
}

- (void)setConfigurationSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationSource, 0);
}

@end
