@implementation FMDEmergencyCallInfoPublisherConfiguration

- (FMDEmergencyCallInfoPublisherConfiguration)initWithCoder:(id)a3
{
  id v4;
  FMDEmergencyCallInfoPublisherConfiguration *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMDEmergencyCallInfoPublisherConfiguration;
  v5 = -[FMDEmergencyCallInfoPublisherConfiguration init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMDEmergencyCallInfoPublisherConfiguration setServerHost:](v5, "setServerHost:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FMDEmergencyCallInfoPublisherConfiguration serverHost](self, "serverHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("serverHost"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[FMDEmergencyCallInfoPublisherConfiguration serverHost](self, "serverHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(0x%lx) %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (void)setServerHost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHost, 0);
}

@end
