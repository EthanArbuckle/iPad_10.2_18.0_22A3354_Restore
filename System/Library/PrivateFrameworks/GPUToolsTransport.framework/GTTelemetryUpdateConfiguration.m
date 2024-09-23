@implementation GTTelemetryUpdateConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTTelemetryUpdateConfiguration)initWithCoder:(id)a3
{
  id v4;
  GTTelemetryUpdateConfiguration *v5;
  uint64_t v6;
  GTTelemetryConfiguration *configuration;
  GTTelemetryUpdateConfiguration *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTTelemetryUpdateConfiguration;
  v5 = -[GTTelemetryRequest initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (GTTelemetryConfiguration *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTTelemetryUpdateConfiguration;
  v4 = a3;
  -[GTTelemetryRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration"), v5.receiver, v5.super_class);

}

- (GTTelemetryConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
